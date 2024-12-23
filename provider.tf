#terraformblock
terraform{
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.82.2"
        }
    }
}
#providerblock
provider "aws" {
  region = "ap-south-1"
}