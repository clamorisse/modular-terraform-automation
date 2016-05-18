variable "region"             {default = "us-east-1"}
variable "tf_s3_bucket"       {default = "tf_infra_bucket"}
variable "master_state_file"  {default = "terraform.tfstate" }


provider "aws" {
	region = "${var.region}"
}

resource "terraform_remote_state" "master_state" {
  backend   = "s3"
  config {
	profile = "default"
	bucket  = "${var.tf_s3_bucket}"
	region  = "${var.region}"
	key     = "${var.master_state_file}"
  }
}
