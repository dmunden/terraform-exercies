variable "vpcid" {
   type = string
   default = "vpc-855f96fc"
}

variable "sg_name" {}

resource "aws_security_group" "sg_module_creation" {
  name        = var.sg_name
  description = "terraform course sg for ec2"
  vpc_id      = var.vpcid

   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

output "sg_id_output" {
   value = aws_security_group.sg_module_creation.id
}