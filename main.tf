#resourceblock
resource "aws_vpc" "vpc"{
    cidr_block = var.myvpc

    tags ={
        Name = var.vpcname
    }
}
resource "aws_subnet" "sub1"{
    vpc_id = aws_vpc.vpc.id
    cidr_block= var.s1
    availability_zone = var.AZ1
    map_public_ip_on_launch = true
    tags ={
        Name = var.sname1
    }
}
resource "aws_subnet" "sub2"{
    vpc_id = aws_vpc.vpc.id
    cidr_block= var.s2
    availability_zone = var.AZ2
    map_public_ip_on_launch = true
    tags ={
        Name = var.sname2
    }

}
resource "aws_internet_gateway""igw"{
    vpc_id = aws_vpc.vpc.id
    tags ={
        Name = var.igw
    }
}
resource "aws_route_table""rtb"{
     vpc_id = aws_vpc.vpc.id
     route{
        cidr_block = var.rtb
        gateway_id = aws_internet_gateway.igw.id

     }
}
resource "aws_route_table_association""rtb1"{
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.rtb.id
}
resource "aws_route_table_association""rtb2"{
    subnet_id = aws_subnet.sub2.id
    route_table_id = aws_route_table.rtb.id
}
resource "aws_security_group""sgw"{
    name= "websg"
    vpc_id = aws_vpc.vpc.id

}
resource "aws_vpc_security_group_ingress_rule" "inward" {
  security_group_id = aws_security_group.sgw.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "inward2" {
  security_group_id = aws_security_group.sgw.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "outward" {
  security_group_id = aws_security_group.sgw.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
resource "aws_instance" "amazon-linux" {
  ami           = var.ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sgw.id]
  subnet_id     = aws_subnet.sub1.id
}