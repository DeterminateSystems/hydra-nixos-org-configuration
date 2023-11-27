resource "hydra_project" "cabal2nix" {
  name         = "cabal2nix"
  display_name = "cabal2nix"
  homepage     = "http://github.com/NixOS/cabal2nix"
  description  = "Convert Cabal files into Nix build instructions"
  owner        = "simons@cryp.to"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "cabal2nix_master" {
  project     = hydra_project.cabal2nix.name
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
