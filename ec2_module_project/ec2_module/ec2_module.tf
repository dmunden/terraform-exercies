variable "vpcid" {
   type = string
   default = "vpc-855f96fc"
}

resource "aws_security_group" "terraform_ec2_sg_module" {
  name        = "terraform_ec2_sg_module"
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

variable "amiid" {
   default = "ami-0bb3fad3c0286ebd5"
}


resource "aws_instance" "terraform_ec2_instance" {
  ami           = var.amiid
  instance_type = "t2.micro"
  key_name = "terraform-course"
  vpc_security_group_ids = [aws_security_group.terraform_ec2_sg_module.id]
  tags = {
    Name = "Terraform Ec2 Instance"
  }
}