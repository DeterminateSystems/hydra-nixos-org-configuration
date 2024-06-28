resource "hydra_project" "nixos" {
  name         = "nixos"
  display_name = "NixOS"
  homepage     = "http://nixos.org/nixos"
  description  = "NixOS, the purely functional Linux distribution"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

