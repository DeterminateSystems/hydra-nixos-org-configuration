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
  state       = "UNKNOWN"
  visible     = 
  name        = "main"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
