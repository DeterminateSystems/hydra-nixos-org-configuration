terraform {
  required_providers {
    hydra = {
      version = "~> 0.1"
      source  = "DeterminateSystems/hydra"
    }
  }
}

resource "hydra_jobset" "staging" {
  project     = var.nixpkgs_project_name
  state       = "enabled"
  visible     = true
  name        = "staging-${var.release_yy_mm}"
  type        = "legacy"
  description = "Staging ${var.release_yy_mm}"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git ${local.staging_branch}"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 5000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_darwin" {
  project     = var.nixpkgs_project_name
  state       = "enabled"
  visible     = true
  name        = "nixpkgs-${var.release_yy_mm}-darwin"
  type        = "legacy"
  description = "Darwin builds for the NixOS ${var.release_yy_mm} release."

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-${var.release_yy_mm}"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 5000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release" {
  project     = var.nixos_project_name
  state       = "enabled"
  visible     = true
  name        = "release-${var.release_yy_mm}"
  type        = "legacy"
  description = "NixOS ${var.release_yy_mm} release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-${var.release_yy_mm}"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = local.stableBranch
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 5000000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "aarch64" {
  project     = var.nixos_project_name
  state       = "enabled"
  visible     = true
  name        = "release-${var.release_yy_mm}-aarch64"
  type        = "legacy"
  description = "NixOS ${var.release_yy_mm} release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "limitedSupportedSystems"
    type              = "nix"
    value             = "[]"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-${var.release_yy_mm}"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = local.stableBranch
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 150000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release_small" {
  project     = var.nixos_project_name
  state       = "enabled"
  visible     = true
  name        = "release-${var.release_yy_mm}-small"
  type        = "legacy"
  description = "NixOS ${var.release_yy_mm} release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-${var.release_yy_mm}"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = local.stableBranch
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 20000000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}


