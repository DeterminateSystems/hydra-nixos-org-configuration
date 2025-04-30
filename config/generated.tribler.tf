resource "hydra_project" "tribler" {
  name         = "tribler"
  display_name = "Tribler"
  homepage     = "http://www.tribler.org/"
  description  = "A peer-to-peer client"
  owner        = "eelco"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "tribler_main" {
  project     = hydra_project.tribler.name
  state       = "disabled"
  visible     = true
  name        = "main"
  type        = "legacy"
  description = "Main branch"

  nix_expression {
    file  = "release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/hydra-config/tribler/trunk"
    notify_committers = false
  }

  input {
    name              = "nixosSrc"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/nixos/trunk"
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

  input {
    name              = "triblerSrc"
    type              = "svn"
    value             = "http://svn.tribler.org/abc/branches/mainbranch"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

