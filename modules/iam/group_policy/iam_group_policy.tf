# ---------------------------------------------
#  Module to associate a policy to a group
# ---------------------------------------------

variable "group_name"    { }
variable "policy_name"    { }
variable "policy"     { }

resource "aws_iam_group_policy" "group-policy" {
  name       = "${var.policy_name}" 
  group      = "${var.group_name}"
  policy     = "${var.policy}"
}

