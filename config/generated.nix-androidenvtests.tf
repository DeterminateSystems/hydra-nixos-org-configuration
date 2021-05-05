resource "hydra_project" "nix-androidenvtests" {
  name         = "nix-androidenvtests"
  display_name = "Nix android tests"
  homepage     = "https://github.com/svanderburg/nix-androidenvtests"
  description  = "Tests for the Android build environment in Nixpkgs"
  owner        = "svanderburg"
  enabled      = false
  visible      = true
}

resource "hydra_jobset" "nix-androidenvtests_nix-androidenvtests-master" {
  project     = hydra_project.nix-androidenvtests.name
  state       = "disabled"
  visible     = true
  name        = "nix-androidenvtests-master"
  type        = "legacy"
  description = "Nix Android tests master"

  nix_expression {
    file  = "deployment/default.nix"
    input = "nixandroidenvtests"
  }

  input {
    name              = "abiVersions"
    type              = "nix"
    value             = "[ \"armeabi-v7a\" \"x86\" ]"
    notify_committers = false
  }

  input {
    name              = "buildPlatformVersions"
    type              = "nix"
    value             = "[ \"16\" \"17\" \"18\" ]"
    notify_committers = false
  }

  input {
    name              = "emulatePlatformVersions"
    type              = "nix"
    value             = "[ \"16\" \"17\" \"18\" ]"
    notify_committers = false
  }

  input {
    name              = "nixandroidenvtests"
    type              = "git"
    value             = "https://github.com/svanderburg/nix-androidenvtests.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git"
    notify_committers = false
  }

  input {
    name              = "systems"
    type              = "nix"
    value             = "[ \"i686-linux\" \"x86_64-linux\" \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}
