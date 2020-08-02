resource "aws_route_table" "terraform-public" {
  vpc_id = "${aws_vpc.myvpc.id}"              

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"    # here attached igw
  }

  tags = {
    Name = "tf-pubsub"
  }
}

resource "aws_route_table_association" "terraform-public" {
  subnet_id      = "${aws_subnet.pubsub.id}"    
  route_table_id = "${aws_route_table.terraform-public.id}"
}

