resource "aws_internet_gateway" "bereCert-IGW" {
    vpc_id = "vpc-736c2c17"

    tags {
        "Name" = "bereCert-IGW"
    }
}
