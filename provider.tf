provider "aws" {
  region = "us-east-1"
}

data "archive_file" "all_permutations" {
  type = "zip"

  source_dir  = "${path.module}/all-permutations"
  output_path = "${path.module}/all-permutations.zip"
}

output "invoke_url" {
  value = aws_apigatewayv2_stage.lambda.invoke_url
  description = "Base URL to call our code at"
}