data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "publish_telemetry" {
  statement {
    effect = "Allow"
    actions = [
      "iot:Connect"
    ]
    resources = [
      "arn:aws:iot:${data.aws_region.current.name}:${data.aws_caller_identity.current.id}:client/${aws_iot_thing.thing.name}"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "iot:Publish"
    ]
    resources = [
      "arn:aws:iot:${data.aws_region.current.name}:${data.aws_caller_identity.current.id}:topic/$aws/things/${aws_iot_thing.thing.name}/telemetry"
    ]
  }
}