output "user_name" {
  value = aws_iam_user.this.name
}

output "user_arn" {
  value = aws_iam_user.this.arn
}

output "credentials" {
  value = {
    access_key_id     = aws_iam_access_key.this.id
    secret_access_key = aws_iam_access_key.this.secret
  }
  sensitive = true
}
