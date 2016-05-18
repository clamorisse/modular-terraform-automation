resource "aws_route_table" "bereCert-Main" {
    vpc_id     = "vpc-736c2c17"

    tags {
        "Name" = "bereCert-Main"
    }
}

resource "aws_route_table" "bereCertRT-IGW" {
    vpc_id     = "vpc-736c2c17"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "igw-106aa374"
    }

    tags {
        "Name" = "bereCertRT-IGW"
    }
}

resource "aws_route_table" "bereCertRT-NAT" {
    vpc_id     = "vpc-736c2c17"

    route {
        cidr_block = "0.0.0.0/0"
    }

    tags {
        "Name" = "bereCertRT-NAT"
    }
}

