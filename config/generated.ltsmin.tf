resource "hydra_project" "ltsmin" {
  name         = "ltsmin"
  display_name = "LTSmin"
  homepage     = "http://fmt.cs.utwente.nl/tools/ltsmin/"
  description  = "LTSmin"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "ltsmin_ltsmin-trunk" {
  project     = hydra_project.ltsmin.name
  state       = "disabled"
  visible     = false
  name        = "ltsmin-trunk"
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
