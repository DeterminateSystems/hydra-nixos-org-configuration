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
