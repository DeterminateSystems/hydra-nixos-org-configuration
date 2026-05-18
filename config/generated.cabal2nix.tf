resource "hydra_project" "cabal2nix" {
  name         = "cabal2nix"
  display_name = "cabal2nix"
  homepage     = "http://github.com/NixOS/cabal2nix"
  description  = "Convert Cabal files into Nix build instructions"
  owner        = "simons@cryp.to"
  enabled      = false
  visible      = false
}

