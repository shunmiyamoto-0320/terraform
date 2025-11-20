

resource "aws_instance" "ec2" {
  # 💡 修正点：ローカル名 "latest_amazon_linux" を使う
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.micro"

  tags = {
    Name = "${var.project}-${var.environment}-ec2-instance"
  }

  subnet_id              = aws_subnet.public_subnet_1a.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
}
