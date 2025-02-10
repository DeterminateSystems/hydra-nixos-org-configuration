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
  state       = "disabled"
  visible     = false
  name        = "trunk"
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
