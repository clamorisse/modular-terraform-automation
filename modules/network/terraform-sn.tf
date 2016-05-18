resource "aws_subnet" "SUB-Public-10-0-1-0-24" {
    vpc_id                  = "vpc-736c2c17"
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false

    tags {
        "Name" = "SUB-Public 10.0.1.0/24"
    }
}

resource "aws_subnet" "SUB-Private-10-0-10-0-24" {
    vpc_id                  = "vpc-736c2c17"
    cidr_block              = "10.0.10.0/24"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false

    tags {
        "Name" = "SUB-Private 10.0.10.0/24"
    }
}

resource "aws_subnet" "SUB-Private-10-0-20-0-24" {
    vpc_id                  = "vpc-736c2c17"
    cidr_block              = "10.0.20.0/24"
    availability_zone       = "us-east-1c"
    map_public_ip_on_launch = false

    tags {
        "Name" = "SUB-Private 10.0.20.0/24"
    }
}

resource "aws_subnet" "SUB-Private-10-0-30-0-24" {
    vpc_id                  = "vpc-736c2c17"
    cidr_block              = "10.0.30.0/24"
    availability_zone       = "us-east-1e"
    map_public_ip_on_launch = false

    tags {
        "Name" = "SUB-Private 10.0.30.0/24"
    }
}
