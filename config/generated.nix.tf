resource "hydra_project" "nix" {
  name         = "nix"
  display_name = "Nix"
  homepage     = ""
  description  = "Nix, the purely functional package manager"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nix_PR-13718" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = false
  name        = "PR-13718"
  type        = "flake"
  description = "https://github.com/NixOS/nix/pull/13718/"

  flake_uri = "github:xokdvium/nix/coverage-hydra-job-restore"

  check_interval    = 7200
  scheduling_shares = 100
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

