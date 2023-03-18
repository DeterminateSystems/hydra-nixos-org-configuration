resource "hydra_project" "node2nix" {
  name         = "node2nix"
  display_name = "node2nix"
  homepage     = ""
  description  = "Deploy NPM packages with the Nix package manager"
  owner        = "svanderburg"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "node2nix_master" {
  project     = hydra_project.node2nix.name
  state       = "enabled"
  visible     = true
  name        = "master"
  type        = "legacy"
  description = "node2nix master"

  nix_expression {
    file  = "release.nix"
    input = "node2nix"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-21.05"
    notify_committers = false
  }

  input {
    name              = "node2nix"
    type              = "git"
    value             = "https://github.com/svanderburg/node2nix.git"
    notify_committers = false
  }

  input {
    name              = "systems"
    type              = "nix"
    value             = "[ \"i686-linux\" \"x86_64-linux\" \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "node2nix_nijs-master" {
  project     = hydra_project.node2nix.name
  state       = "UNKNOWN"
  visible     = 
  name        = "nijs-master"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
