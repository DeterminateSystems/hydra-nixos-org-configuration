resource "hydra_project" "kde" {
  name         = "kde"
  display_name = "KDE"
  homepage     = "http://www.kde.org"
  description  = "KDE"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "kde_amarok-master" {
  project     = hydra_project.kde.name
  state       = "disabled"
  visible     = false
  name        = "amarok-master"
  type        = "legacy"
  description = "Amarok master"

  nix_expression {
    file  = "amarok/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "amarokSrc"
    type              = "git"
    value             = "git://gitorious.org/amarok/amarok.git"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/hydra-config/kde/trunk"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git"
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
  email_override      = "armijn@uulug.nl"
}
