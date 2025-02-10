resource "hydra_project" "pil" {
  name         = "pil"
  display_name = "PIL"
  homepage     = ""
  description  = "PIL"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "pil_pil-trunk" {
  project     = hydra_project.pil.name
  state       = "disabled"
  visible     = false
  name        = "pil-trunk"
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
