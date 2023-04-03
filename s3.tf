# # deploy S3 bucket
# #----------------------------------------------------
# # random alphanum
# resource "random_id" "randomize" {
#   byte_length = 8
# }

# resource "aws_s3_bucket" "remote_backend_s3" {
#   bucket        = "${var.app_name}-${var.s3_name}-${random_id.randomize.hex}"
#   force_destroy = var.s3_force_destroy

#   tags = {
#     Name        = "${var.app_name}-${var.s3_name}-s3"
#     Environment = var.environment
#     Terraform   = "true"
#   }
# }
# # set s3 to private
# resource "aws_s3_bucket_public_access_block" "s3_private_access" {
#   bucket                  = aws_s3_bucket.remote_backend_s3.id
#   block_public_acls       = var.block_public_acls
#   block_public_policy     = var.block_public_policy
#   ignore_public_acls      = var.ignore_public_acls
#   restrict_public_buckets = var.restrict_public_buckets
# }
