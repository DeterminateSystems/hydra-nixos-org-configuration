resource "hydra_project" "acoda" {
  name         = "acoda"
  display_name = "Acoda"
  homepage     = "http://swerl.tudelft.nl/bin/view/Acoda"
  description  = "Acoda is a tool set for automatic data migration along an evolving data model"
  owner        = "sander"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "acoda_trunk" {
  project     = hydra_project.acoda.name
  state       = "UNKNOWN"
  visible     = 
  name        = "trunk"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
