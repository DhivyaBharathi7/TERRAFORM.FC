#valuesgivenbyprovider
output "vpc_id"{
    value=aws_vpc.vpc.id
}
output "subnet_id"{
    value= aws_subnet.sub1.id
}
output "gateway_id"{
    value=aws_internet_gateway.igw.id
}
output "route_table_id"{
    value= aws_route_table.rtb.id
}
output "security_group"{
    value=aws_security_group.sgw.id
}