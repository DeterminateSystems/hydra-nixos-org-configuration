resource "hydra_project" "uulib" {
  name         = "uulib"
  display_name = "UU Haskell Lib"
  homepage     = "http://www.cs.uu.nl/wiki/bin/view/HUT/PrettyPrintingCombinators"
  description  = "Universiteit Utrecht Parser combinator library and pretty printer"
  owner        = "amiddelk"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "uulib_trunk" {
  project     = hydra_project.uulib.name
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
