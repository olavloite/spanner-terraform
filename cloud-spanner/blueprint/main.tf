resource "random_string" "launch_id" {
  length  = 4
  special = false
  upper   = false
}

locals {
  suffix = format("%s-%s", "tf", random_string.launch_id.result)
}

module omegatrade {
  source         = "../modules/cloudspanner"
  suffix         = local.suffix
  gcp_project_id = var.gcp_project_id
  config         = "regional-asia-east1"
  instance_id    = "kiteretsu"
  dbname         = "kiteretsu"
  labels_var     = { env = "test" }
  num_nodes      = 5
}
