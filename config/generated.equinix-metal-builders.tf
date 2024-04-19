resource "hydra_project" "equinix-metal-builders" {
  name         = "equinix-metal-builders"
  display_name = "Equinix Metal builders"
  homepage     = ""
  description  = "NixOS systems for hydra.nixos.org's Equinix Metal builders."
  owner        = "graham@grahamc.com"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "equinix-metal-builders_aarch64-community-box" {
  project     = hydra_project.equinix-metal-builders.name
  state       = "enabled"
  visible     = true
  name        = "aarch64-community-box"
  type        = "flake"
  description = ""

  flake_uri = "github:lheckemann/aarch64-build-box"

  check_interval    = 900
  scheduling_shares = 500000
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "equinix-metal-builders_main" {
  project     = hydra_project.equinix-metal-builders.name
  state       = "enabled"
  visible     = true
  name        = "main"
  type        = "flake"
  description = ""

  flake_uri = "github:NixOS/equinix-metal-builders"

  check_interval    = 900
  scheduling_shares = 500000
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}
