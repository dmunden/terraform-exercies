provider "aws" {
    region = "eu-west-1"
    profile = "testing"

}

// this is a string variable

variable "firststring"{
    type = "string"
    default = "this is my first string"
}

variable "multilinestring"{
    type = "string"
    default = <<EOH
    this is a multiline
    string
    newline
    EOH
}

output "myfirstoutput" {
    value = "${var.firststring}"
}

output "mymultilineoutput" {
    value = "${var.multilinestring}"
}


//maps example
variable "mapexample"{
    type = "map"
    default = {
        "useast" = "ami-1"
        "euwest" = "ami-2"
    }
}

output "mapoutput"{
    value = "${var.mapexample["euwest"]}"
}

//lists example
variable "mysecuritygrouplist" {
    type = "list"
    default = ["sg1", "sg2", "sg3"]
}

output "sgoutput"{
    value = "${var.mysecuritygrouplist}"
}

//bool example
variable "testbool" {
    default = false
}

output "booloutput" {
    value = "${var.testbool}"
}


variable "myinputvariable" {
    type = "string"
}

output "myoutputvariable" {
sensitive = true
    value = "${var.myinputvariable}"
}


