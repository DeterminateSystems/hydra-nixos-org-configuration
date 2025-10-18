resource "hydra_project" "hydra" {
  name         = "hydra"
  display_name = "Hydra"
  homepage     = ""
  description  = "Hydra, the Nix-based continuous build system"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

