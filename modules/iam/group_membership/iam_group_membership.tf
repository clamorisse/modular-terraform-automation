# --------------------------------------------
#    Module to assign users to groups
# --------------------------------------------

variable "membership_name"  { }
variable "group_name"       { }
variable "user_names"       { }


resource "aws_iam_group_membership" "membership" {
  name   = "${var.membership_name}"
  group = "${var.group_name.name}"
  #users  = ["${var.user_names.user.*.users}"]
  users = ["${split(",", var.user_names)}"]
}
