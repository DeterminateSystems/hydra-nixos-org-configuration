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

resource "hydra_jobset" "flakes_dhdm" {
  project     = hydra_project.flakes.name
  state       = "enabled"
  visible     = true
  name        = "dhdm"
  type        = "flake"
  description = ""

  flake_uri = "github:edolstra/dhdm"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "flakes_hugefs" {
  project     = hydra_project.flakes.name
  state       = "disabled"
  visible     = false
  name        = "hugefs"
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

resource "hydra_jobset" "flakes_nickel" {
  project     = hydra_project.flakes.name
  state       = "enabled"
  visible     = true
  name        = "nickel"
  type        = "flake"
  description = "Nickel"

  flake_uri = "github:tweag/nickel"

  check_interval    = 1800
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "flakes_nix-serve" {
  project     = hydra_project.flakes.name
  state       = "enabled"
  visible     = true
  name        = "nix-serve"
  type        = "flake"
  description = "A binary cache server"

  flake_uri = "github:edolstra/nix-serve"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "flakes_nixos-homepage" {
  project     = hydra_project.flakes.name
  state       = "enabled"
  visible     = true
  name        = "nixos-homepage"
  type        = "flake"
  description = ""

  flake_uri = "github:NixOS/nixos-homepage"

  check_interval    = 1800
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "flakes_sst" {
  project     = hydra_project.flakes.name
  state       = "enabled"
  visible     = true
  name        = "sst"
  type        = "flake"
  description = "Simple Structured Text"

  flake_uri = "github:edolstra/sst"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "flakes_template-c-hello" {
  project     = hydra_project.flakes.name
  state       = "enabled"
  visible     = true
  name        = "template-c-hello"
  type        = "flake"
  description = "C Hello template"

  flake_uri = "github:NixOS/templates?dir=c-hello"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "flakes_template-rust-web-server" {
  project     = hydra_project.flakes.name
  state       = "enabled"
  visible     = true
  name        = "template-rust-web-server"
  type        = "flake"
  description = "Rust web server template"

  flake_uri = "github:NixOS/templates?dir=rust-web-server"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}
