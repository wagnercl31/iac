data "archive_file" "init" {
  type        = "zip"
  source_file = "python/api.py"
  output_path = "api.zip"
}

resource "aws_lambda_function" "api" {
  filename      = data.archive_file.init.output_path
  function_name = "api-demo"
  role          = aws_iam_role.api_role.arn
  handler       = "api.lambda_handler"

  source_code_hash = filebase64sha256(data.archive_file.init.output_path)

  runtime = "python3.8"
}
