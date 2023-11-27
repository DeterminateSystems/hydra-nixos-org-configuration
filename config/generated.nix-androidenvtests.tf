resource "hydra_project" "nix-androidenvtests" {
  name         = "nix-androidenvtests"
  display_name = "Nix android tests"
  homepage     = "https://github.com/svanderburg/nix-androidenvtests"
  description  = "Tests for the Android build environment in Nixpkgs"
  owner        = "svanderburg"
  enabled      = false
  visible      = true
}

resource "hydra_jobset" "nix-androidenvtests_nix-androidenvtests-master" {
  project     = hydra_project.nix-androidenvtests.name
  state       = "UNKNOWN"
  visible     = 
  name        = "nix-androidenvtests-master"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
