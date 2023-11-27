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
  state       = "UNKNOWN"
  visible     = 
  name        = "master"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}

resource "hydra_jobset" "composer2nix_pndp-master" {
  project     = hydra_project.composer2nix.name
  state       = "enabled"
  visible     = true
  name        = "pndp-master"
  type        = "legacy"
  description = "PNDP master"

  nix_expression {
    file  = "release.nix"
    input = "pndp"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-21.11"
    notify_committers = false
  }

  input {
    name              = "pndp"
    type              = "git"
    value             = "https://github.com/svanderburg/pndp.git"
    notify_committers = false
  }

  input {
    name              = "systems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 1
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}
