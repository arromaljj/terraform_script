provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
provider "aws" {
  region = var.aws_region
}