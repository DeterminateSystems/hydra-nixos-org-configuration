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

resource "hydra_jobset" "nixops_hetzner" {
  project     = hydra_project.nixops.name
  state       = "disabled"
  visible     = false
  name        = "hetzner"
  type        = "legacy"
  description = "Hetzner branch"

  nix_expression {
    file  = "release.nix"
    input = "nixopsSrc"
  }

  input {
    name              = "nixopsSrc"
    type              = "git"
    value             = "https://github.com/aszlig/nixops.git hetzner"
    notify_committers = false
  }

  input {
    name              = "nixos"
    type              = "git"
    value             = "https://github.com/NixOS/nixos.git"
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
    value             = "true"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixops_kms" {
  project     = hydra_project.nixops.name
  state       = "disabled"
  visible     = true
  name        = "kms"
  type        = "legacy"
  description = "AWS KMS support"

  nix_expression {
    file  = "release.nix"
    input = "nixopsSrc"
  }

  input {
    name              = "nixopsSrc"
    type              = "git"
    value             = "https://github.com/Bsami/nixops.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 1800
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = "eelco.dolstra@logicblox.com, aszlig@redmoonstudios.org"
}

resource "hydra_jobset" "nixops_master" {
  project     = hydra_project.nixops.name
  state       = "enabled"
  visible     = true
  name        = "master"
  type        = "legacy"
  description = "Master branch"

  nix_expression {
    file  = "release.nix"
    input = "nixopsSrc"
  }

  input {
    name              = "nixopsSrc"
    type              = "git"
    value             = "https://github.com/NixOS/nixops.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-19.09"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixops_nixops-1_1_2" {
  project     = hydra_project.nixops.name
  state       = "disabled"
  visible     = true
  name        = "nixops-1.1.2"
  type        = "legacy"
  description = "Master branch"

  nix_expression {
    file  = "release.nix"
    input = "nixopsSrc"
  }

  input {
    name              = "nixopsSrc"
    type              = "git"
    value             = "https://github.com/NixOS/nixops.git 1.1.2"
    notify_committers = false
  }

  input {
    name              = "nixos"
    type              = "git"
    value             = "https://github.com/NixOS/nixos.git c9b4e6fda20d5751bfcb1666138fc518f1481aa8"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git cbcba0a2f8e582fb7e08cd99dc9cb6d1db9f9c6e"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com, aszlig@redmoonstudios.org"
}

resource "hydra_jobset" "nixops_nixops-azure" {
  project     = hydra_project.nixops.name
  state       = "disabled"
  visible     = true
  name        = "nixops-azure"
  type        = "legacy"
  description = "Azure"

  nix_expression {
    file  = "release.nix"
    input = "nixopsSrc"
  }

  input {
    name              = "nixopsSrc"
    type              = "git"
    value             = "https://github.com/phreedom/nixops nixops-master"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 1800
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

