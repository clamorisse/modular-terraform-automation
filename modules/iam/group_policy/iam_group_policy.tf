# ---------------------------------------------
#  Module to associate a policy to a group
# ---------------------------------------------

variable "group_name"    { }
variable "policy_name"    { }
variable "policy_arn"     { }

resource "aws_iam_policy_attachment" "group-policy" {
  name       = "${var.policy_name}" 
  groups     = ["${var.group_name}"]
  policy_arn = "${var.policy_arn}"
}

