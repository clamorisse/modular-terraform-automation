#-------------------------------------------
#  Global infrastructure resources for terraform
#-------------------------------------------
variable "tfstate_bucket" { }
variable "tf_region" { }

resource "aws_s3_bucket" "tf_infra_bucket" {
    bucket = "${var.tfstate_bucket}" 
    acl = "private"
    versioning {
        enabled = true
    }
    tags {
        Name = "terraform-bootstrap-state"
        Environment = "bootstrap"
    }
}

output "tf_infra_bucket" {
    value = "${aws_s3_bucket.tf_infra_bucket.id}"
}
