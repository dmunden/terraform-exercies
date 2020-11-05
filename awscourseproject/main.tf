provider "aws" {
    region = "eu-west-1"
    profile = "testing"

}

module "network_module" {
    source = "./network_module"
}

module "loadbalancer_module" {
	source = "./loadbalancer_module"
	publicsg_id = "${module.network_module.publicsg_id}"
}