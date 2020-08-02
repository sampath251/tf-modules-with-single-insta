output "vpc-name" {
  value = "${aws_vpc.myvpc.tags.name}"
}
