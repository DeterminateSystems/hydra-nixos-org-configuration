resource "hydra_project" "nixpkgs" {
  name         = "nixpkgs"
  display_name = "Nixpkgs"
  homepage     = "http://nixos.org/nixpkgs"
  description  = "Nix Packages collection"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nixpkgs_aarch64-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "aarch64-darwin"
  type        = "legacy"
  description = "testing aarch64-darwin: PR #105026"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "limitedSupportedSystems"
    type              = "nix"
    value             = "[ ]"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/thefloweringash/nixpkgs.git apple-silicon"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 3000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

