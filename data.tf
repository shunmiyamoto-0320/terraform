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


data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  # 💡 修正点 1: x86_64 アーキテクチャを指定
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  # 💡 修正点 2: x86_64 の AMI 名パターンを指定
  filter {
    name = "name"
    # al2023 の標準的な x86_64 AMIパターン
    values = ["al2023-ami-*x86_64*"]
  }
}
