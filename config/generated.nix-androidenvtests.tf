resource "hydra_project" "nix-androidenvtests" {
  name         = "nix-androidenvtests"
  display_name = "Nix android tests"
  homepage     = "https://github.com/svanderburg/nix-androidenvtests"
  description  = "Tests for the Android build environment in Nixpkgs"
  owner        = "svanderburg"
  enabled      = false
  visible      = true
}

