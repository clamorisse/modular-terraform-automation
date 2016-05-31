# ------------------------------------------------------------
#                     CREATES GROUP OF USERS
#          WITH LIMITED ACCESSABILITY TO AWS RESOURCES
# ------------------------------------------------------------

# ---------------- General variables -------------------------

variable "env"                         { }
variable "prefix-blog"                 { }
variable "prefix-ec2"                  { }
variable "prefix-s3"                   { }

# ----------------------- Users ------------------------------

variable "blog_admins"                 { }
variable "ec2_admins"                  { }
variable "s3_admins"                   { }

# ------------------------------------------------------------

count_blog = "${length(split(",", var.blog_admins))}"
count_ec2  = "${length(split(",", var.ec2_admins))}"
count_s3   = "${length(split(",", var.s3_admins))}"

// Creates all users in the list

module "iam-users" {
  source = "../../modules/iam/users"

  user_names  = "${concat(${var.blog_admins}, ${var.ec2_admins}, ${var.s3admins})}"
}

// Creates all groups

module "iam-group" {
  source = "../../modules/iam/groups"

  group_names = "${var.prefix_blog}-group,${var.prefix_ec2}-group,${var.prefix_s3}-group"
}

// Attaches policy for the blog administratos group

module "blog_admins-group-policy" {

  source = "../../modules/iam/group_policy"

  group_name   = "${element(module.iam-group.res_iam_groups, 0)}"
  policy_name  = "${var.priv}-policy"
  policy = <<EOF
{
  "Version"   : "2012-10-17",
  "Statement" : [
    {
	"Effect"   : "Allow",
	"Action"   : "*",
	"Resource" : "*"
    }
  ]
}
EOF
}

/*
// Associates blog_admin-users to the blog_admin-group

module "group-members" {
  source = "../../modules/iam/group_membership"
  count = "${length(split(",", module.iam-users.users))-(count-ec2+count_s3)}"
  membership_name = "membership-${var.prefix}-group"
  group_name      = "${module.iam-group.res_iam_groups}"
  user_names      = "${module.iam-users.users}"
}
*/
