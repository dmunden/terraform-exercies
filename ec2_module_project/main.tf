provider "aws" {
    region = "eu-west-1"
    profile = "testing"

}

module "ec2_module"  {
   source = "./ec2_module"
}