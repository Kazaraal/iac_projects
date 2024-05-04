terraform {
  backend "s3" {
    bucket      = "my-backend-s3-kk"
    key         = "kk-nginx.tfstate"
    region      = "eu-west-2"
  }
}
