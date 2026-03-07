resource "hydra_project" "nixos" {
  name         = "nixos"
  display_name = "NixOS"
  homepage     = "http://nixos.org/nixos"
  description  = "NixOS, the purely functional Linux distribution"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nixos_bash-4_3" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "bash-4.3"
  type        = "legacy"
  description = "Bash 4.3 test"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git bash-4.3"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

