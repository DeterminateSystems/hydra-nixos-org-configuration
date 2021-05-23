resource "hydra_project" "groove" {
  name         = "groove"
  display_name = "Groove"
  homepage     = "http://groove.sourceforge.net"
  description  = "Groove"
  owner        = "noadmin"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "groove_groove-trunk" {
  project     = hydra_project.groove.name
  state       = "disabled"
  visible     = true
  name        = "groove-trunk"
  type        = "legacy"
  description = "Groove trunk"

  nix_expression {
    file  = "release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "build"
    type              = "build"
    value             = "build"
    notify_committers = false
  }

  input {
    name              = "grooveReleaseSrc"
    type              = "svn"
    value             = "https://groove.svn.sourceforge.net/svnroot/groove/release/trunk/"
    notify_committers = false
  }

  input {
    name              = "grooveSrc"
    type              = "svn"
    value             = "https://groove.svn.sourceforge.net/svnroot/groove/groove/trunk/"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://nixos.org/repos/utwente-hydra/groove"
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
    name              = "src"
    type              = "build"
    value             = "src"
    notify_committers = false
  }

  input {
    name              = "svn"
    type              = "build"
    value             = "svn"
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
  email_override      = ""
}
