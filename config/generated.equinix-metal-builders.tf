resource "hydra_project" "equinix-metal-builders" {
  name         = "equinix-metal-builders"
  display_name = "Equinix Metal builders"
  homepage     = ""
  description  = "NixOS systems for hydra.nixos.org's Equinix Metal builders."
  owner        = "graham@grahamc.com"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "equinix-metal-builders_main" {
  project     = hydra_project.equinix-metal-builders.name
  state       = "enabled"
  visible     = true
  name        = "main"
  type        = "flake"
  description = ""

  flake_uri = "github:NixOS/equinix-metal-builders"

  check_interval    = 43200
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}
