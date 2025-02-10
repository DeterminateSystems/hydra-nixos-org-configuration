resource "hydra_project" "equinix-metal-builders" {
  name         = "equinix-metal-builders"
  display_name = "Equinix Metal builders"
  homepage     = ""
  description  = "NixOS systems for hydra.nixos.org's Equinix Metal builders."
  owner        = "graham@grahamc.com"
  enabled      = false
  visible      = true
}

resource "hydra_jobset" "equinix-metal-builders_aarch64-community-box" {
  project     = hydra_project.equinix-metal-builders.name
  state       = "disabled"
  visible     = false
  name        = "aarch64-community-box"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "equinix-metal-builders_main" {
  project     = hydra_project.equinix-metal-builders.name
  state       = "disabled"
  visible     = false
  name        = "main"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
