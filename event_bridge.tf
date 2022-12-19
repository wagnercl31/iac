

resource "aws_cloudwatch_event_rule" "lambda_func_event_rule" {
  name                = "lambda_func_event_rule"
  description         = "retry scheduled every 1 hour"
  schedule_expression = "rate(1 hour)"
}

resource "aws_cloudwatch_event_target" "lambda_func_event_rule" {
  arn  = aws_lambda_function.api.arn
  rule = aws_cloudwatch_event_rule.lambda_func_event_rule.name
}



resource "aws_lambda_permission" "allow_cloudwatch_to_call_rw_fallout_retry_step_deletion_lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_func_event_rule.arn
}
