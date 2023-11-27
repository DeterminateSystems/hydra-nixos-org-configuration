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
  state       = "UNKNOWN"
  visible     = 
  name        = "ltsmin-trunk"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
