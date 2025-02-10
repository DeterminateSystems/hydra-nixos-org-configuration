resource "hydra_project" "libchop" {
  name         = "libchop"
  display_name = "libchop"
  homepage     = "http://nongnu.org/libchop/"
  description  = "libchop, tools & library for data backup and distributed storage"
  owner        = "ludo"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "libchop_master" {
  project     = hydra_project.libchop.name
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
