resource "hydra_project" "nix" {
  name         = "nix"
  display_name = "Nix"
  homepage     = ""
  description  = "Nix, the purely functional package manager"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nix_PR-1643" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = true
  name        = "PR-1643"
  type        = "legacy"
  description = "Preserve file context across readFile, second take"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "git://github.com/abbradar/nix.git readfile 1"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-17.09"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

