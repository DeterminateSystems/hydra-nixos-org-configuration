resource "hydra_project" "mobile-nixos" {
  name         = "mobile-nixos"
  display_name = "Mobile NixOS"
  homepage     = "https://mobile.nixos.org"
  description  = "NixOS, for your phone"
  owner        = "samuel@dionne-riel.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "mobile-nixos_unstable" {
  project     = hydra_project.mobile-nixos.name
  state       = "disabled"
  visible     = false
  name        = "unstable"
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
