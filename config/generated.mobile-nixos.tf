resource "hydra_project" "mobile-nixos" {
  name         = "mobile-nixos"
  display_name = "Mobile NixOS"
  homepage     = "https://mobile.nixos.org"
  description  = "NixOS, for your phone"
  owner        = "samuel@dionne-riel.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "mobile-nixos_unstable" {
  project     = hydra_project.mobile-nixos.name
  state       = "enabled"
  visible     = true
  name        = "unstable"
  type        = "legacy"
  description = "Mobile NixOS, built with nixos-unstable."

  nix_expression {
    file  = "release.nix"
    input = "mobile-nixos"
  }

  input {
    name              = "inNixOSHydra"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "mobile-nixos"
    type              = "git"
    value             = "https://github.com/NixOS/mobile-nixos.git development"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git nixos-unstable"
    notify_committers = false
  }

  input {
    name              = "systems"
    type              = "nix"
    value             = "[ \"aarch64-linux\" \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}
