resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_networkfirewall_firewall" "firew" {
  name                = "firew"
  firewall_policy_arn = aws_networkfirewall_firewall_policy.firew.arn
  vpc_id              = aws_vpc.myvpc.id
  subnet_mapping {
    subnet_id = aws_subnet.subnet1.id
  }

}

resource "aws_nat_gateway" "gwNAT" {
  # allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.subnet1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gwNAT]
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "internetgw"
  }
}