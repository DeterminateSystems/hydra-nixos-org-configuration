resource "hydra_project" "experimental-nix-installer" {
  name         = "experimental-nix-installer"
  display_name = "Experimental Nix Installer"
  homepage     = "https://github.com/NixOS/experimental-nix-installer"
  description  = "A fork of the Determinate Nix Installer (https://github.com/determinateSystems/nix-installer) to experiment with upstreaming."
  owner        = "travis.a.everett@gmail.com"
  enabled      = true
  visible      = true
}

