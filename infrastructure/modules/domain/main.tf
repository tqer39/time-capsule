/*
 * # Usage
 *
 * ## Abstract
 *
 * - プロダクトに必要なドメイン（host zone = `プロダクト名.tld` の部分）の設定を行います。
 * - サブドメイン（`xxx.プロダクト名.tld` の `xxx` の部分）を作成するモジュールは別途設けます。
 */

resource "aws_route53_zone" "this" {
  name = var.domain_name
}
