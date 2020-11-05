provider "aws" {
    region = "eu-west-1"
    profile = "testing"

}

module "sg_module" {
   sg_name = "sg_ec2_${local.env}"
   source = "./sg_module"
}

module "ec2_module_1"  {
   sg_id = module.sg_module.sg_id_output
   ec2_name = "Ec2_Instance_${local.env}"
   source = "./ec2_module"
}

locals {
   amiid_env {
       default = "amiid_default"
       production = "amiid_production"
       sataging = "amiid_production"
   } 
}

locals {
   env = terraform.workspace

   amiid = lookup(local.amiid_env, local.env)
}


output "envspecicoutput_variable"  {
    value = local.amiid
}