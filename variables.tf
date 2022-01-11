variable "aws_region" {
    default = "us-east-2"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "common_tags" {
  description = "Common tags to apply to all resoures"
  type = map
  default = {
      Owner = "nemo"
      Project = "webserver"
      Environment = "development"
  }
}