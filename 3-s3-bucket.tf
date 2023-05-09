# Create an S3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = "eks-bucket-igorpost"
}

# Create an IAM policy that allows access to the S3 bucket
resource "aws_iam_policy" "s3_policy" {
  name = "my-eks-s3-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:List*",
          "s3:Put*",
          "s3:Delete*"
        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.mybucket.arn}/*"
      }
    ]
  })
}

# Create an IAM role that can assume the EKS worker node role
resource "aws_iam_role" "worker_role" {
  name = "my-eks-worker-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach the S3 policy to the IAM role
resource "aws_iam_role_policy_attachment" "worker_role_policy" {
  policy_arn = aws_iam_policy.s3_policy.arn
  role       = aws_iam_role.worker_role.name
}


# Output the S3 bucket name and ARN
output "s3_bucket_name" {
  value = aws_s3_bucket.mybucket.bucket
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.mybucket.arn
}
