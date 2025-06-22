variable "ami_id" {
  description = "ami id of the instance"
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  
  default = {
    dev = "t3.micro"
    prod = "t2.small"
  }
}


variable "sg_name" {
  default = "allow_all"
}

variable "description" {
  type    = string
  default = "allowing all traffic from internet"
}

variable "from_port" {
  type    = number
  default = 0
}
variable "to_port" {
  type    = number
  default = 0
}

variable "protocol" {
  default = "-1"
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "allow_all"

  }
}

variable "instances" {
  type    = list(string)
  default = ["mongodb", "frontend"]
}

variable "project" {
  default = "Roboshop"
}

variable "common_tags" {
  default = {
    project   = "roboshop"
    terraform = true
  }

}