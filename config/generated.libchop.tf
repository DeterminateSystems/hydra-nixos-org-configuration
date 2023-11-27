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
