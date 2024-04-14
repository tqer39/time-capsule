variable "dev_name_servers" {
  description = "開発環境: アクセス権限移譲元の NS レコードの一覧。同一AWSアカウントならDatasourceで取得可能。別のAWSアカウントの場合は直指定。"
  type        = list(string)
}

variable "dev_domain_name" {
  description = "開発環境: アクセス権限移譲元のドメイン名。"
  type        = string
}

variable "domain_name" {
  description = "本番環境: ドメイン名。"
  type        = string
}

variable "ttl" {
  description = "ttl値"
  type        = string
}

variable "allow_overwrite" {
  description = "既存のレコードがある場合上書き可能とするか。"
  type        = bool
  default     = true
}
