Hedwig Lambda Subscription Terraform module
===========================================

[Hedwig](https://github.com/Automatic/hedwig) is a inter-service communication bus that works on AWS SQS/SNS, while keeping things pretty simple and
straight forward. It uses [json schema](http://json-schema.org/) draft v4 for schema validation so all incoming
and outgoing messages are validated against pre-defined schema.

This module provides a custom [Terraform](https://www.terraform.io/) modules for deploying Hedwig infrastructure that
creates Hedwig subscriptions for Hedwig consumer apps hosted on AWS Lambda.

## Usage

```hcl
module "topic-dev-user-updated-v1" {
  source = "Automatic/hedwig-topic/aws"
  topic  = "dev-user-updated-v1"
}

resource "aws_lambda_function" "dev-myFunction" {
  ...
}
  
module "sub-dev-myapp-dev-user-updated" {
  source             = "Automatic/hedwig-lambda-subscription/aws"
  function           = "${aws_lambda_function.dev-myFunction.arn}"
  function_name      = "${aws_lambda_function.dev-myFunction.function_name}"
  function_qualifier = "deployed"

  topic              = "${module.topic-dev-user-updated-v1.arn}"
}
```

## Lambda Function Config

Following things are required in your Lambda function config for publishing:

Role policy should include:
```hcl
  statement {
    actions = [
      "SNS:Publish"
    ]
    resources = [
      "arn:aws:sns:<YOUR-AWS-REGION>:<YOUR-AWS-ACCOUNT>:hedwig-*"
    ]
  }
```


## Release Notes

[Github Releases](https://github.com/Automatic/terraform-aws-hedwig-lambda-subscription/releases)

## How to publish

Go to [Terraform Registry](https://registry.terraform.io/modules/Automatic/hedwig-lambda-subscription/aws), and Resync 
module.
