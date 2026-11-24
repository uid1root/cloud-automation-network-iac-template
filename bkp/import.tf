resource "aws_instance" "ec2_legada" {
    ami = "ami-0aacbf72109c53c0c"
    instance_type = "t3.micro"
    tags = {
        Name = "ec2-legada"
    }
  ### Configuration omitted for brevity ###
}