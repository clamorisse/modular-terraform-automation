# -----------------------------------------
#   Module to create iam groups
# -----------------------------------------

variable "group_name" { }

resource "aws_iam_group" "group" {
  count = "${length(split(",", var.group_name))}"
  name  = "${element(split(",", var.group_name), count.index)}"
}

output "res_iam_groups" { value = "${join(",", aws_iam_group.group.*.name)}" }
