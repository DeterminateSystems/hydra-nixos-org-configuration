resource "hydra_project" "psat" {
  name         = "psat"
  display_name = "PSAT"
  homepage     = "http://www.program-transformation.org/PHP/"
  description  = "PHP analysis tools"
  owner        = "eelco"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "psat_php-front" {
  project     = hydra_project.psat.name
  state       = "disabled"
  visible     = false
  name        = "php-front"
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

resource "hydra_jobset" "psat_php-sat" {
  project     = hydra_project.psat.name
  state       = "disabled"
  visible     = false
  name        = "php-sat"
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

resource "hydra_jobset" "psat_php-tools" {
  project     = hydra_project.psat.name
  state       = "disabled"
  visible     = false
  name        = "php-tools"
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
