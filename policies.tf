resource "aws_iam_policy" "ec2_full" {
  name = "ec2_full"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "elasticloadbalancing:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "cloudwatch:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": [
                        "autoscaling.amazonaws.com",
                        "ec2scheduled.amazonaws.com",
                        "elasticloadbalancing.amazonaws.com",
                        "spot.amazonaws.com",
                        "spotfleet.amazonaws.com",
                        "transitgateway.amazonaws.com"
                    ]
                }
            }
        }
    ]
}
EOF
}

resource "aws_iam_policy" "s3_bucket_policy" {
  name = "s3_bucket_policy_for_IAM_user"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:Get*",
        "s3:List*",
        "s3:Delete*",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::builders01-bucket"
    }
  ]
}
EOF

}

resource "aws_iam_policy" "api" {
  name        = "api_for_lambda"
  path        = "/"
  description = "Policy for api"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1598854465023",
      "Action":"logs:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}




resource "aws_iam_role" "api_role" {
  name = "api_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "api_attach" {
  role       = aws_iam_role.api_role.name
  policy_arn = aws_iam_policy.api.arn
}
