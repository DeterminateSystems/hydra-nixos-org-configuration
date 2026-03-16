resource "hydra_project" "flakes" {
  name         = "flakes"
  display_name = "Flakes"
  homepage     = ""
  description  = ""
  owner        = "edolstra@gmail.com"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "flakes_blender-bin" {
  project     = hydra_project.flakes.name
  state       = "enabled"
  visible     = true
  name        = "blender-bin"
  type        = "flake"
  description = ""

  flake_uri = "github:edolstra/nix-warez?dir=blender"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

