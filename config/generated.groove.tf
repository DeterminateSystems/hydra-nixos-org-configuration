resource "hydra_project" "groove" {
  name         = "groove"
  display_name = "Groove"
  homepage     = "http://groove.sourceforge.net"
  description  = "Groove"
  owner        = "noadmin"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "groove_groove-trunk" {
  project     = hydra_project.groove.name
  state       = "disabled"
  visible     = false
  name        = "groove-trunk"
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
