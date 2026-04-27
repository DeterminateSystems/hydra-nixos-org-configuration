resource "hydra_project" "coccinelle" {
  name         = "coccinelle"
  display_name = "Coccinelle"
  homepage     = "http://coccinelle.lip6.fr"
  description  = "Coccinelle is a program matching and transformation engine that provides support for semantic patches"
  owner        = "amiddelk"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "coccinelle_trunk" {
  project     = hydra_project.coccinelle.name
  state       = "disabled"
  visible     = true
  name        = "trunk"
  type        = "legacy"
  description = "trunk"

  nix_expression {
    file  = "release.nix"
    input = "cocciSrc"
  }

  input {
    name              = "cocciSrc"
    type              = "git"
    value             = "https://github.com/amiddelk/cocci-head.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "x86_64-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
