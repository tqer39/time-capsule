#!/bin/bash

# $1: デプロイパイプラインのパス
# $2: git diff 差分情報配列文字列
deploy_pipeline_path=$1
IFS=',' read -ra git_diffs <<< "$2"

echo
echo ---------------
echo "deploy_pipeline_path: ${deploy_pipeline_path}"

echo
# GitHubActions ワークフロー変更チェック
for diff in "${git_diffs[@]}"; do
  if [[ "${diff}" =~ ^\.github/(actions|workflows)/.*\.yml$ ]]; then
    echo "共通のワークフローが修正されたのでこのデプロイパイプラインは処理対象です。"
    exit 0 # 処理対象として返す
  fi
done

# terraform にて参照する全てのディレクトリを取得する関数
# 引数
# $1: 対象ディレクトリ(パイプラインのパス)
# ----------------------------------
# 戻り値
# 　対象ディレクトリ配下参照ディレクトリ配列
find_references() {
  (
    dir="$1"
    # 指定されたディレクトリ内の.tfファイルを調査
    while IFS= read -r -d '' tf_file; do
      # `source = "../../xxx/xxx"` の行を取得
      references=$(grep 'source[[:space:]]*=[[:space:]]*"' "$tf_file" | grep '\.\./')
      if [ -z "$references" ]; then
        continue
      fi
      echo "$references" | while read -r line ; do
        reference=$(echo "$line" | awk -F'["]' '{print $2}')
        current_dir=$(pwd)
        tf_dir=$(dirname "$tf_file")
        cd "$tf_dir" && cd "$reference" || exit
        reference_absolute=$(pwd)
        cd "$current_dir" || exit
        echo "$reference_absolute"
        # 再帰呼出
        find_references "$reference_absolute"
      done
    done < <(find "$dir" -name '*.tf' -print0)
  )
}
echo
readarray -t refs < <(find_references "$deploy_pipeline_path")
echo "-- 関連/参照しているディレクトリ一覧 --"
ref_rel_paths=("$deploy_pipeline_path") && echo "$deploy_pipeline_path"
for ref in "${refs[@]}"; do
  ref_rel_path=$(echo "$ref" | awk -F '/terraform/' '{print "terraform/" $2}')
  ref_rel_paths+=("$ref_rel_path")
  echo "$ref_rel_path"
done

echo
declare -a diff_rel_paths=()
echo "-- 変更/追加のあったディレクトリ一覧 --"
for diff in "${git_diffs[@]}"; do
  diff_rel_path=$(echo "$diff" | rev | cut -d'/' -f2- | rev) # ファイル名を除去
  diff_rel_paths+=("$diff_rel_path")
  echo "$diff_rel_path"
done

# 照合
declare -a changed_items=()
for diff in "${diff_rel_paths[@]}"; do
  for ref in "${ref_rel_paths[@]}"; do
    if [ "$diff" = "$ref" ]; then
      changed_items+=("$ref")
    fi
  done
done
echo
if [ ${#changed_items[@]} -eq 0 ]; then
  echo "マッチするディレクトリが無かったので処理対象外です。"
  exit 1 # 処理対象外
else
  echo "マッチするディレクトリがあったので処理対象です。"
  echo "-- 関連/参照 & 変更があったディレクトリ一覧 --"
  for item in "${changed_items[@]}"; do
    echo "$item"
  done
  exit 0 # 処理対象
fi
