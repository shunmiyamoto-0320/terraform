# data.tf
# 1. 現在のリージョン情報を取得するためのデータソース
data "aws_region" "current" {}

# 2. 取得したリージョン名を使ってS3プレフィックスリストを検索します。
data "aws_prefix_list" "s3_pl" {
  # 以前の name = "..." は削除します。

  filter {
    name   = "prefix-list-name"
    values = ["com.amazonaws.${data.aws_region.current.name}.s3"]
  }
}
