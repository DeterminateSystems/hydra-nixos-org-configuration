resource "hydra_project" "mobile-nixos" {
  name         = "mobile-nixos"
  display_name = "Mobile NixOS"
  homepage     = "https://mobile.nixos.org"
  description  = "NixOS, for your phone"
  owner        = "samuel@dionne-riel.com"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "mobile-nixos_unstable" {
  project     = hydra_project.mobile-nixos.name
  state       = "UNKNOWN"
  visible     = 
  name        = "unstable"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
