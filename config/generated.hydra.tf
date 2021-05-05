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
  type        = "flake"
  description = "Flake branch"

  flake_uri = "github:NixOS/hydra/flake"

  check_interval    = 600
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "hydra_hydra-ant-logger-trunk" {
  project     = hydra_project.hydra.name
  state       = "enabled"
  visible     = true
  name        = "hydra-ant-logger-trunk"
  type        = "legacy"
  description = "Hydra Ant Logger"

  nix_expression {
    file  = "release.nix"
    input = "src"
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
    name              = "src"
    type              = "git"
    value             = "https://github.com/NixOS/hydra-ant-logger.git"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "hydra_hydra-master" {
  project     = hydra_project.hydra.name
  state       = "disabled"
  visible     = false
  name        = "hydra-master"
  type        = "legacy"
  description = "Hydra 'branch' for Rob"

  nix_expression {
    file  = "release.nix"
    input = "hydraSrc"
  }

  input {
    name              = "hydraSrc"
    type              = "git"
    value             = "git://gitorious.org/hydra/hydra.git"
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
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "i686-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "rob.vermaas@gmail.com"
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
