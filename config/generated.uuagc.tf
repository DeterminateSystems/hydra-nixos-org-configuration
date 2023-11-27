resource "hydra_project" "uuagc" {
  name         = "uuagc"
  display_name = "UU Attribute Grammar"
  homepage     = "http://www.cs.uu.nl/wiki/HUT/AttributeGrammarSystem"
  description  = "Universiteit Utrecht Attribute Grammar Compiler"
  owner        = "amiddelk"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "uuagc_trunk" {
  project     = hydra_project.uuagc.name
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
