resource "hydra_project" "composer2nix" {
  name         = "composer2nix"
  display_name = "composer2nix"
  homepage     = ""
  description  = "Deploy PHP composer packages with the Nix package manager"
  owner        = "svanderburg"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "composer2nix_master" {
  project     = hydra_project.composer2nix.name
  state       = "enabled"
  visible     = true
  name        = "master"
  type        = "legacy"
  description = "composer2nix master"

  nix_expression {
    file  = "release.nix"
    input = "composer2nix"
  }

  input {
    name              = "composer2nix"
    type              = "git"
    value             = "https://github.com/svanderburg/composer2nix.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-21.11"
    notify_committers = false
  }

  input {
    name              = "systems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 1
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "composer2nix_pndp-master" {
  project     = hydra_project.composer2nix.name
  state       = "disabled"
  visible     = false
  name        = "pndp-master"
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
