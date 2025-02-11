resource "hydra_project" "ltsmin" {
  name         = "ltsmin"
  display_name = "LTSmin"
  homepage     = "http://fmt.cs.utwente.nl/tools/ltsmin/"
  description  = "LTSmin"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "ltsmin_ltsmin-trunk" {
  project     = hydra_project.ltsmin.name
  state       = "disabled"
  visible     = true
  name        = "ltsmin-trunk"
  type        = "legacy"
  description = "LTSmin trunk"

  nix_expression {
    file  = "release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://nixos.org/repos/utwente-hydra/ltsmin"
    notify_committers = false
  }

  input {
    name              = "ltsminSrc"
    type              = "git"
    value             = "http://fmt.cs.utwente.nl/tools/scm/ltsmin.git"
    notify_committers = false
  }

  input {
    name              = "mcrl2Support"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "mcrlSupport"
    type              = "boolean"
    value             = "true"
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
    name              = "openmpiSupport"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "x86_64-linux"
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
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}
