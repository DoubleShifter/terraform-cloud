resource "aws_launch_configuration" "web" {
	name_prefix = "Highly-Available-LC-"
	image_id = data.aws_ami.latest_amazon_linux.id
	instance_type = "t2.micro"
	security_groups = [aws_security_group.sg.id]
	user_data = file("terraform-script.sh")

	lifecycle {    
		create_before_destroy = true  
	}
}  