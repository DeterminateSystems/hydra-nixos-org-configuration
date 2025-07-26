resource "hydra_project" "nixops" {
  name         = "nixops"
  display_name = "NixOps"
  homepage     = "https://github.com/NixOS/nixops"
  description  = "NixOS-based network/cloud deployment tool"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nixops_flake-support" {
  project     = hydra_project.nixops.name
  state       = "enabled"
  visible     = true
  name        = "flake-support"
  type        = "flake"
  description = "Flake support"

  flake_uri = "github:NixOS/nixops/flake-support"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

