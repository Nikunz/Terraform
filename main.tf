#Security group
resource "aws_security_group" "wk21sg" {
  name        = "wk21sg"
  description = "Allow inbound traffic on tcp/22, tcp/80"
  vpc_id      = "vpc-007cf62dc349b3e83"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Autoscaling group
resource "aws_launch_template" "autoscale_temp" {
  name_prefix            = "autoscale_temp"
  image_id               = var.ami_id
  instance_type          = var.instance
  vpc_security_group_ids = [aws_security_group.wk21sg.id]
  user_data = filebase64("${path.root}/script.sh")

}
resource "aws_autoscaling_group" "autoscalegroup" {
  desired_capacity = 2
  max_size         = 5
  min_size         = 2

  vpc_zone_identifier = [var.subnet_id_1, var.subnet_id_2]

  launch_template {
    id      = aws_launch_template.autoscale_temp.id
    version = "$Latest"
  }
}

