resource "aws_security_group" "serveraccess" {
  name = "allow_egress"
  vpc_id = aws_vpc.server.id
}

resource "aws_security_group_rule" "egress" {
  type = "egress"
  from_port = 0
  to_port = 0
  security_group_id = aws_security_group.serveraccess.id
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}