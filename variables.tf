#valuesto resource
#vpc variable
variable "myvpc"{
    type = string
    default = "10.0.0.0/16"
}
variable "vpcname"{
    type = string
    default = "my-vpc"
}
variable "s1"{
    type = string
    default = "10.0.0.0/24"
}
variable "sname1"{
    type = string
    default = "sub1"
}
variable "AZ1"{
    type = string
    default = "ap-south-1a"
}
variable "s2"{
    type = string
    default = "10.0.1.0/24"
}
variable "sname2"{
    type = string
    default = "sub2"
}
variable "AZ2"{
    type = string
    default = "ap-south-1b"
}
variable "igw"{
    type = string
    default = "gw"
}
variable "rtb"{
    type = string
    default ="0.0.0.0/0"
}
variable "ami"{
    type = string
    default ="ami-0fd05997b4dff7aac"
}