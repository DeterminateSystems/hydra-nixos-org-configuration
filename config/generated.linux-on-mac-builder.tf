resource "hydra_project" "linux-on-mac-builder" {
  name         = "linux-on-mac-builder"
  display_name = "Linux on Mac builder"
  homepage     = "https://github.com/nix-community/linuxkit-builder/"
  description  = "An easy to use Linux builder for macOS"
  owner        = "graham@grahamc.com"
  enabled      = false
  visible      = true
}

resource "hydra_jobset" "linux-on-mac-builder_master" {
  project     = hydra_project.linux-on-mac-builder.name
  state       = "enabled"
  visible     = true
  name        = "master"
  type        = "legacy"
  description = "LinuxKit Nix is a Linux builder for macOS machines. See https://github.com/nix-community/linuxkit-nix"

  nix_expression {
    file  = "release.nix"
    input = "linuxkit-nix"
  }

  input {
    name              = "linuxkit-nix"
    type              = "git"
    value             = "https://github.com/nix-community/linuxkit-nix.git master"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixpkgs-unstable"
    notify_committers = false
  }

  check_interval    = 36000
  scheduling_shares = 1000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "linux-on-mac-builder_staging" {
  project     = hydra_project.linux-on-mac-builder.name
  state       = "UNKNOWN"
  visible     = 
  name        = "staging"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
