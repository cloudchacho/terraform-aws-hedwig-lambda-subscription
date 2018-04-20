variable "function_arn" {
  description = "Lambda function ARN for the consumer"
}

variable "function_name" {
  description = "Lambda function name for the consumer"
}

variable "function_qualifier" {
  description = "Lambda function qualifier for the consumer, this may be used to trigger functions based on aliases"
  default     = ""
}

variable "topic" {
  description = "SNS ARN for the Hedwig topic"
}
