resource "hydra_project" "hydra" {
  name         = "hydra"
  display_name = "Hydra"
  homepage     = ""
  description  = "Hydra, the Nix-based continuous build system"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "hydra_build-ng" {
  project     = hydra_project.hydra.name
  state       = "disabled"
  visible     = false
  name        = "build-ng"
  type        = "legacy"
  description = "New queue runner"

  nix_expression {
    file  = "release.nix"
    input = "hydraSrc"
  }

  input {
    name              = "hydraSrc"
    type              = "git"
    value             = "https://github.com/NixOS/hydra.git build-ng"
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

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 2

  email_notifications = true
  email_override      = "rob.vermaas@gmail.com, eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "hydra_flake" {
  project     = hydra_project.hydra.name
  state       = "disabled"
  visible     = false
  name        = "flake"
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

resource "hydra_jobset" "hydra_hydra-ant-logger-trunk" {
  project     = hydra_project.hydra.name
  state       = "disabled"
  visible     = false
  name        = "hydra-ant-logger-trunk"
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

resource "hydra_jobset" "hydra_hydra-master" {
  project     = hydra_project.hydra.name
  state       = "disabled"
  visible     = false
  name        = "hydra-master"
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

resource "hydra_jobset" "hydra_master" {
  project     = hydra_project.hydra.name
  state       = "enabled"
  visible     = true
  name        = "master"
  type        = "flake"
  description = "Master branch"

  flake_uri = "github:NixOS/hydra"

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 2

  email_notifications = false
  email_override      = ""
}
