resource "hydra_project" "ofborg" {
  name         = "ofborg"
  display_name = "ofborg"
  homepage     = "https://github.com/NiXOS/ofborg"
  description  = "OfBorg automation"
  owner        = "graham@grahamc.com"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "ofborg_cole-flake" {
  project     = hydra_project.ofborg.name
  state       = "disabled"
  visible     = false
  name        = "cole-flake"
  type        = "flake"
  description = "Cole's work to make ofborg a flake."

  flake_uri = "github:cole-h/ofborg/flakeify"

  check_interval    = 3600
  scheduling_shares = 10000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "ofborg_next" {
  project     = hydra_project.ofborg.name
  state       = "enabled"
  visible     = true
  name        = "next"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = "release.nix"
    input = "ofborg"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs-channels.git nixpkgs-unstable"
    notify_committers = false
  }

  input {
    name              = "ofborg"
    type              = "git"
    value             = "https://github.com/grahamc/ofborg.git next"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 1000000
  keep_evaluations  = 3

  email_notifications = true
  email_override      = "graham@grahamc.com"
}

resource "hydra_jobset" "ofborg_release" {
  project     = hydra_project.ofborg.name
  state       = "enabled"
  visible     = true
  name        = "release"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = "release.nix"
    input = "ofborg"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs-channels.git nixpkgs-unstable"
    notify_committers = false
  }

  input {
    name              = "ofborg"
    type              = "git"
    value             = "https://github.com/nixos/ofborg.git released"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 1000000
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}
