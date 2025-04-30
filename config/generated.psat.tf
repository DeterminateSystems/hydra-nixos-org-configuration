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
  visible     = true
  name        = "php-front"
  type        = "legacy"
  description = "Parser and pretty-printer for PHP"

  nix_expression {
    file  = "release.nix"
    input = "phpfrontSrc"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "phpfrontSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/psat/php-front/trunk"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "i686-linux"
    notify_committers = false
  }

  input {
    name              = "tarball"
    type              = "build"
    value             = "tarball"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

