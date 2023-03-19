resource "hydra_project" "uulib" {
  name         = "uulib"
  display_name = "UU Haskell Lib"
  homepage     = "http://www.cs.uu.nl/wiki/bin/view/HUT/PrettyPrintingCombinators"
  description  = "Universiteit Utrecht Parser combinator library and pretty printer"
  owner        = "amiddelk"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "uulib_trunk" {
  project     = hydra_project.uulib.name
  state       = "disabled"
  visible     = true
  name        = "trunk"
  type        = "legacy"
  description = "Trunk build"

  nix_expression {
    file  = "release.nix"
    input = "uulibSrc"
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

  input {
    name              = "uulibSrc"
    type              = "svn"
    value             = "https://subversion.cs.uu.nl/repos/project.STEC.uulib/uulib/trunk/"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "ariem@cs.uu.nl"
}
