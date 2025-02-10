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

  check_interval    = 3600
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "node2nix_nijs-master" {
  project     = hydra_project.node2nix.name
  state       = "disabled"
  visible     = false
  name        = "nijs-master"
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
