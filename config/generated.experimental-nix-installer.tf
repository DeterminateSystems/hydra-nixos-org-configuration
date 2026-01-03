resource "hydra_project" "experimental-nix-installer" {
  name         = "experimental-nix-installer"
  display_name = "Experimental Nix Installer"
  homepage     = "https://github.com/NixOS/experimental-nix-installer"
  description  = "A fork of the Determinate Nix Installer (https://github.com/determinateSystems/nix-installer) to experiment with upstreaming."
  owner        = "travis.a.everett@gmail.com"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "experimental-nix-installer_experimental-installer" {
  project     = hydra_project.experimental-nix-installer.name
  state       = "enabled"
  visible     = true
  name        = "experimental-installer"
  type        = "flake"
  description = "installer crimes"

  flake_uri = "github:NixOS/experimental-nix-installer/main"

  check_interval    = 6000
  scheduling_shares = 10000
  keep_evaluations  = 2

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "experimental-nix-installer_pr-51" {
  project     = hydra_project.experimental-nix-installer.name
  state       = "disabled"
  visible     = false
  name        = "pr-51"
  type        = "flake"
  description = "Upstream changes"

  flake_uri = "github:NixOS/experimental-nix-installer/update-from-upstream"

  check_interval    = 7200
  scheduling_shares = 10000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
