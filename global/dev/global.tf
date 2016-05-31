# ------------------------------------------------------------
#                 GLOBAL INFRASTRUCTURE 
# ------------------------------------------------------------

# ---------------- General variables -------------------------

variable "env"                         { }
variable "priv"                        { }
variable "dept"                        { }
variable "prefix"                      { }

variable "users"                       { }
variable "admin-arn-policy"            { }
# ------------------------------------------------------------

// Creates all users in the list

module "iam-admin-users" {
  source = "../../modules/iam/users"

  user_names  = "${var.users}"
}

// Creates the group for this list of users

module "iam-admin-group" {
  source = "../../modules/iam/groups"

  group_name = "${var.prefix}-group"
}

// Attaches policy for this group

module "iam-admin-group-policy" {

  source = "../../modules/iam/group_policy"

  group_name   = "${module.iam-admin-group.res_iam_groups}"
  policy_name  = "${var.priv}-policy"
  policy_arn   = "${var.admin-arn-policy}"

/*  policy = <<EOF
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
*/
}

// Associates users to this group

module "group-members" {
  source = "../../modules/iam/group_membership"

  membership_name = "membership-${var.prefix}-group"
  group_name      = "${module.iam-admin-group.res_iam_groups}"
  user_names      = "${module.iam-admin-users.users}"
}
