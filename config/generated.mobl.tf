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
