provider "aws" {
	# shared_credentials_file = /home/nemo/.aws/credentials
	# profile = prod
	region = var.aws_region
}

data "aws_availability_zones" "available" {}
data "aws_ami" "latest_amazon_linux" {
	owners = [ "amazon" ]
	most_recent = true
	filter {
		name = "name"
		values = ["amzn2-ami-hvm-*-x86_64-gp2"]
	}
}

resource "aws_security_group" "sg" {
	name = "WebServer Security Group"
	description = "First Security Group"

	ingress {
     	from_port = 22
     	to_port = 22
     	protocol = "tcp" 
     	cidr_blocks = ["0.0.0.0/0"]
  	}

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = merge(var.common_tags, {Environment = "${var.common_tags["Environment"]} Nginx Web Server"})
}

resource "aws_eip" "static_ip" {
	tags = merge(var.common_tags, {Environment = "${var.common_tags["Environment"]} configuration"})
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = data.aws_availability_zones.available.names[1]
}

