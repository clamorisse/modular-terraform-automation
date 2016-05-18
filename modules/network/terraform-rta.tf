resource "aws_route_table_association" "bereCertRT-IGW-rtbassoc-5b4fc03c" {
    route_table_id = "rtb-1fe3e17b"
    subnet_id = "subnet-3ebb7e14"
}

resource "aws_route_table_association" "bereCertRT-NAT-rtbassoc-3050df57" {
    route_table_id = "rtb-21eeec45"
    subnet_id = "subnet-07821d3a"
}

resource "aws_route_table_association" "bereCertRT-NAT-rtbassoc-3250df55" {
    route_table_id = "rtb-21eeec45"
    subnet_id = "subnet-cb74ba93"
}

resource "aws_route_table_association" "bereCertRT-NAT-rtbassoc-2850df4f" {
    route_table_id = "rtb-21eeec45"
    subnet_id = "subnet-56bd0a20"
}

