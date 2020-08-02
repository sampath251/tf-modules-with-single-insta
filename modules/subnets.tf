resource "aws_subnet" "pubsub" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${var.pubsub_cidr}"

  tags = {
    Name = "tf-pubsub"
  }
}
resource "aws_subnet" "presub" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${var.presub_cidr}"
   tags = {
    Name = "tf-presub"
  }
  
}
