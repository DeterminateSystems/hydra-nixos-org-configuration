resource "hydra_project" "dwarffs" {
  name         = "dwarffs"
  display_name = "DwarfFS"
  homepage     = "https://github.com/edolstra/dwarffs"
  description  = ""
  owner        = "edolstra@gmail.com"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "dwarffs_master" {
  project     = hydra_project.dwarffs.name
  state       = "enabled"
  visible     = true
  name        = "master"
  type        = "flake"
  description = "Default branch"

  flake_uri = "github:edolstra/dwarffs"

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
