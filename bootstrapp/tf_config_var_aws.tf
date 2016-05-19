variable "tf_region" {
	default = "us-east-1"
}

provider "aws" {
	region  = "${var.tf_region}"
	profile = "default"
}
