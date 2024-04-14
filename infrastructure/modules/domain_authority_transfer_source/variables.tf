variable "domain_name" {
  description = "ドメインのアクセス権限移譲元のドメイン名"
  type        = string
}

variable "require_certificate" {
  type        = bool
  description = "ドメイン名に対して証明書を発行するかどうか"
}

variable "dev_name_servers" {
  description = "開発環境: アクセス権限移譲元の NS レコードの一覧。同一AWSアカウントならDatasourceで取得可能。別のAWSアカウントの場合は直指定。"
  type        = list(string)
  default     = []
}

variable "dev_domain_name" {
  description = "開発環境: アクセス権限移譲元のドメイン名。"
  type        = string
  default     = null
}

variable "is_production" {
  description = "これが本番環境か否か。"
  type        = bool
}
