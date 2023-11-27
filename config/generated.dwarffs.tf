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
  state       = "UNKNOWN"
  visible     = 
  name        = "master"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
