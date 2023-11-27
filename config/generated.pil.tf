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
  state       = "UNKNOWN"
  visible     = 
  name        = "pil-trunk"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
