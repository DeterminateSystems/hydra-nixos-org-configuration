resource "hydra_project" "nix-pills" {
  name         = "nix-pills"
  display_name = "nix-pills"
  homepage     = "https://github.com/nixos/nix-pills"
  description  = "The missing explanations from the more formal documents."
  owner        = "graham@grahamc.com"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nix-pills_master" {
  project     = hydra_project.nix-pills.name
  state       = "UNKNOWN"
  visible     = 
  name        = "master"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
