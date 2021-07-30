terraform {
  backend "remote" {
    organization = "IBM-Techlanders"

    workspaces {
      name = "module-check"
    }
  }
}
provider "aws" {
    region = "us-east-2"
}

module "server2" {
  source  = "app.terraform.io/IBM-Techlanders/module-ec2-s3/aws"
  version = "1.0.0"
    i_type = "t2.nano"
    bucket = "gagandeep-bucket-44"
}

output "IP" {
 value = module.server2.PUBLIC_IP
}
