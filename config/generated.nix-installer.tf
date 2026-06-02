resource "hydra_project" "nix-installer" {
  name         = "nix-installer"
  display_name = "Nix Installer"
  homepage     = "https://github.com/NixOS/nix-installer"
  description  = "A fork of the Determinate Nix Installer (https://github.com/determinateSystems/nix-installer)"
  owner        = "joerg@thalheim.io"
  enabled      = true
  visible      = true
}

