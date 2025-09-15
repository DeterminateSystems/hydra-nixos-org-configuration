resource "hydra_project" "nixops" {
  name         = "nixops"
  display_name = "NixOps"
  homepage     = "https://github.com/NixOS/nixops"
  description  = "NixOS-based network/cloud deployment tool"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

