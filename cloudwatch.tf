resource "aws_cloudwatch_log_group" "api_gw" {
  name = "/aws/api_gw/${aws_apigatewayv2_api.lambda.name}"

  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "function" {
  name = "/aws/lambda/${aws_lambda_function.all_permutations.function_name}"

  retention_in_days = 30
}