resource "aws_vpc" "bereCertVPC" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = false
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        "Name" = "bereCertVPC"
    }
}

