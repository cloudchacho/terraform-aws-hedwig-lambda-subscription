resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = "${var.topic}"
  protocol  = "lambda"
  endpoint  = "${var.function_arn}"
}

resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "${format("AllowExecutionFromSNS%s", md5(var.topic))}"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  qualifier     = "${var.function_qualifier}"
  principal     = "sns.amazonaws.com"
  source_arn    = "${var.topic}"
}
