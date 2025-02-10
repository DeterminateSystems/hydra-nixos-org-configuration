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
  visible     = false
  name        = "main"
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

resource "hydra_jobset" "tribler_release-5-3-x" {
  project     = hydra_project.tribler.name
  state       = "disabled"
  visible     = true
  name        = "release-5-3-x"
  type        = "legacy"
  description = "5.3 stable release branch"

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
    value             = "i686-linux"
    notify_committers = false
  }

  input {
    name              = "triblerSrc"
    type              = "svn"
    value             = "http://svn.tribler.org/abc/branches/release-5.3.x"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "tribler_release-5-4-x" {
  project     = hydra_project.tribler.name
  state       = "disabled"
  visible     = true
  name        = "release-5-4-x"
  type        = "legacy"
  description = "5.4 stable release branch"

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
    value             = "http://svn.tribler.org/abc/branches/release-5.4.x"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}
