resource "aws_vpc" "server" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "server" {
  vpc_id     = aws_vpc.server.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.server.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "internet" {
  vpc_id = aws_vpc.server.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "internet"
  }
}
resource "aws_route_table_association" "internet" {
  subnet_id      = aws_subnet.server.id
  route_table_id = aws_route_table.internet.id
}
