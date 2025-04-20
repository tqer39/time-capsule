# プロジェクトドキュメント

このドキュメントは、プロジェクトの構成や設計思想について説明します。

## 設計思想

1. **明確な分離**
   - `frontend`, `backend`, `infra` のように役割ごとにフォルダを分けることで、各部分の責任範囲が明確です。
   - 生成AIはフォルダ名やファイル名からその内容を推測しやすくなります。

2. **標準的な慣習に基づく**
   - Next.js や FastAPI の一般的なプロジェクト構成に従っています。
   - 生成AIはこれらのフレームワークの標準構成を学習しているため、提案や補完が正確になります。

3. **モノレポ構成の採用**
   - モノレポ構成は、複数のプロジェクトを一元管理できるため、依存関係やCI/CDの設定が簡単になります。
   - 生成AIはモノレポ構成を理解しやすく、全体の依存関係や設定を把握した上で提案を行えます。

4. **フォルダ名とファイル名の一貫性**
   - `components`, `pages`, `api`, `models` など、一般的な命名規則を採用しています。
   - 生成AIはこれらの名前をトリガーとして適切なコードを生成しやすくなります。

5. **ドキュメントの配置**
   - 各フォルダに `README.md` を配置することで、フォルダの目的や使用方法を記載できます。
   - これにより、人間と生成AIの両方がプロジェクトの意図を理解しやすくなります。

## フロントエンドセットアップ

以下の手順で Next.js プロジェクトをセットアップしました。

### 実行コマンド
```bash
cd /home/tqer39/workspace/time-capsule/frontend
npx create-next-app@latest . --typescript
```

### プロンプトへの回答
- **Would you like to use ESLint?**: Yes
- **Would you like to use Tailwind CSS?**: Yes
- **Would you like your code inside a `src/` directory?**: Yes
- **Would you like to use App Router? (recommended)**: Yes
- **Would you like to use Turbopack for `next dev`?**: Yes
- **Would you like to customize the import alias (`@/*` by default)?**: Yes
- **What import alias would you like configured?**: `@/*`

### 結果
```plaintext
Using npm.

Initializing project with template: app-tw


Installing dependencies:
- react
- react-dom
- next

Installing devDependencies:
- typescript
- @types/node
- @types/react
- @types/react-dom
- @tailwindcss/postcss
- tailwindcss
- eslint
- eslint-config-next
- @eslint/eslintrc


added 321 packages, and audited 322 packages in 32s

132 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
Success! Created frontend at /home/tqer39/workspace/time-capsule/frontend

npm notice
npm notice New major version of npm available! 10.8.2 -> 11.3.0
npm notice Changelog: https://github.com/npm/cli/releases/tag/v11.3.0
npm notice To update run: npm install -g npm@11.3.0
npm notice
```

この手順により、`frontend` ディレクトリに Next.js プロジェクトが作成されました。
