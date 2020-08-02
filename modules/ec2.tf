resource "aws_instance" "public-instances" {

  ami   = "ami-0ac80df6eff0e70b5" #ubunut
  instance_type               = "t2.micro"
  key_name                    = "devops"
  subnet_id                   = "${aws_subnet.pubsub.id}"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
 # user_data = "${file("script.sh")}"
  #user_data = file("${./modules}/script.sh")
  user_data = <<-EOF
                #!/bin/bash
               sudo apt update -y
               sudo apt install openjdk -8-jdk
               wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
               sudo sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > \
               /etc/apt/sources.list.d/jenkins.list'
               sudo apt-get update
               sudo apt-get install jenkins
               sudo service jenkins start
               sudo apt install unzip -y 
            EOF
  tags = {
    Name  = "TF-pubserv"
    Env   = "Prod"
    Owner = "Sampath"
  }
}