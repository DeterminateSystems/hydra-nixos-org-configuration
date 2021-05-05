resource "hydra_project" "nix-pills" {
  name         = "nix-pills"
  display_name = "nix-pills"
  homepage     = "https://github.com/nixos/nix-pills"
  description  = "The missing explanations from the more formal documents."
  owner        = "graham@grahamc.com"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nix-pills_master" {
  project     = hydra_project.nix-pills.name
  state       = "enabled"
  visible     = true
  name        = "master"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = "release.nix"
    input = "nix-pills"
  }

  input {
    name              = "nix-pills"
    type              = "git"
    value             = "https://github.com/NixOS/nix-pills.git master"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.03"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 100000
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}
