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
  state       = "disabled"
  visible     = false
  name        = "master"
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
