resource "aws_key_pair" "main" {
  key_name   = "web-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD73z3dodzDJMmU0d6uHC8WYz/2/UCP2M7BqAYqndOqBhWxSXVMzcj/tVHo727CR1atswMtaBWsfKEJzFdVPcncBq5VXbHOn4+564ucfo4jcCXBEwji88d63AQgLvycYuj4qzBN4uUyxk9cF6GYQovl3V3shGNsVe54EoMx82rKSGV6JBe0NKQxC4txVWF4JcNfx5x6RXFDn2wUeQ2ggzyKPUdLgqybAv/fkAeLJGLa6LrV78PYLIDcnRn6WhhWavueECwqwnZ79l0e9w1atbjJ6Othd4Ex/Q3JSuFZAcO3TDfs75TurN5m2wq3AQzLbinbGftUFC1l3120ZHd7orqrreLH+ss/hz+q3DIa6SQELZcma7gEbbb4b0G3NWlznCPQXj0I1BOQuBa6csye5Mv8bVx0j7ln8eSmsyexiDhSW/EGOMPVbp9eU3IbFq7ZrZIHwWEkTfCkWro2jeGxvdffeEC6AmH0ydtDgsLlMKV5755Mqb1R+eRfTg5VIV4YTX0= lolam@Lolas-Air.lan"

}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/16"

  tags = {
    Name = "Main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
variable "subnet_id" {}

data "aws_route_table" "selected" {
  subnet_id = var.subnet_id
}

resource "aws_route" "route" {
  route_table_id            = aws_vpc.main.id
  destination_cidr_block    = "10.0.1.0/16"
}
