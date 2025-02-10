resource "hydra_project" "coccinelle" {
  name         = "coccinelle"
  display_name = "Coccinelle"
  homepage     = "http://coccinelle.lip6.fr"
  description  = "Coccinelle is a program matching and transformation engine that provides support for semantic patches"
  owner        = "amiddelk"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "coccinelle_trunk" {
  project     = hydra_project.coccinelle.name
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
