locals {
   env = "${terraform.workspace}"

      vpcid_env = {
        default = "vpc-855f96fc"
        staging = "vpc-855f96fc"
        production = "vpc-855f96fc"
   }

   vpcid = "${lookup(local.vpcid_env, local.env)}"

   publicsubnetid1_env = {
        default = "subnet-1e327544"
        staging = "subnet-1e327544"
        production = "subnet-1e327544"
   }
   publicsubnetid1 = "${lookup(local.publicsubnetid1_env, local.env)}"

      publicsubnetid2_env = {
        default = "subnet-37dbe151"
        staging = "subnet-37dbe151"
        production = "subnet-37dbe151"
   }
   publicsubnetid2 = "${lookup(local.publicsubnetid2_env, local.env)}"

   privatesubnetid_env = {
        default = "subnet-37dbe151"
        staging = "subnet-37dbe151"
        production = "subnet-37dbe151"
   }
   privatesubnetid = "${lookup(local.privatesubnetid_env, local.env)}"

}

output "vpcid" {
   value = "${local.vpcid}"
}

output "publicsubnetid1" {
   value = "${local.publicsubnetid1}"
}

output "publicsubnetid2" {
   value = "${local.publicsubnetid2}"
}

output "privatesubnetid" {
   value = "${local.privatesubnetid}"
}

output "env_suffix" {
   value = "${local.env}"
}
