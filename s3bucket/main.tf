provider "aws" {
    region = "eu-west-1"
    profile = "testing"

}

resource "aws_s3_bucket" "mybucket"  {
    bucket = "mybucket-tfcourse-021120"
    acl = "private"

    tags = {
       Environment = "Dev"
    }
}


resource "aws_s3_bucket_object" "myfirstobject" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "testfile.txt"
  source = "../s3bucket/testfiles/sampleobject.txt"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("../s3bucket/testfiles/sampleobject.txt")
}