resource "hydra_project" "gnu" {
  name         = "gnu"
  display_name = "GNU"
  homepage     = "http://www.gnu.org"
  description  = "GNU's Not Unix"
  owner        = "ludo"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "gnu_autoconf-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "autoconf-master"
  type        = "legacy"
  description = "GNU Autoconf"

  nix_expression {
    file  = "autoconf/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "autoconfSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/autoconf.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "i686-linux"
    notify_committers = false
  }

  input {
    name              = "tarball"
    type              = "build"
    value             = "tarball"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = true
  email_override      = ""
}

