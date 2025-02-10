resource "hydra_project" "mobl" {
  name         = "mobl"
  display_name = "Mobl"
  homepage     = "http://mobl-lang.org"
  description  = "Mobl"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "mobl_master" {
  project     = hydra_project.mobl.name
  state       = "disabled"
  visible     = false
  name        = "master"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
