resource "aws_route_table" "terraform-private" {
  vpc_id = "${aws_vpc.myvpc.id}"              

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"    # here attached igw
  }

  tags = {
    Name = "tf-presub"
  }
}

resource "aws_route_table_association" "terraform-private" {
  subnet_id      = "${aws_subnet.presub.id}"    
  route_table_id = "${aws_route_table.terraform-private.id}"
}

