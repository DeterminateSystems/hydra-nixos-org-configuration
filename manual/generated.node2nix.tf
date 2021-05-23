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
    value             = "https://github.com/NixOS/nixpkgs.git release-20.09"
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
  state       = "enabled"
  visible     = true
  name        = "nijs-master"
  type        = "legacy"
  description = "NiJS master"

  nix_expression {
    file  = "release.nix"
    input = "nijs"
  }

  input {
    name              = "nijs"
    type              = "git"
    value             = "https://github.com/svanderburg/nijs.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs.git release-20.09"
    notify_committers = false
  }

  input {
    name              = "systems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 1
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}
