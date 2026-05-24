resource "hydra_project" "nix-installer" {
  name         = "nix-installer"
  display_name = "Nix Installer"
  homepage     = "https://github.com/NixOS/nix-installer"
  description  = "A fork of the Determinate Nix Installer (https://github.com/determinateSystems/nix-installer)"
  owner        = "joerg@thalheim.io"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nix-installer_nix-installer" {
  project     = hydra_project.nix-installer.name
  state       = "enabled"
  visible     = true
  name        = "nix-installer"
  type        = "flake"
  description = "nix installer main branch"

  flake_uri = "github:NixOS/nix-installer/main"

  check_interval    = 6000
  scheduling_shares = 10000
  keep_evaluations  = 2

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix-installer_pr-51" {
  project     = hydra_project.nix-installer.name
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
