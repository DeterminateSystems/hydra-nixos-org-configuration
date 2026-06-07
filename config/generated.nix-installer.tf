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

