resource "hydra_project" "uuagc" {
  name         = "uuagc"
  display_name = "UU Attribute Grammar"
  homepage     = "http://www.cs.uu.nl/wiki/HUT/AttributeGrammarSystem"
  description  = "Universiteit Utrecht Attribute Grammar Compiler"
  owner        = "amiddelk"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "uuagc_trunk" {
  project     = hydra_project.uuagc.name
  state       = "disabled"
  visible     = true
  name        = "trunk"
  type        = "legacy"
  description = "Trunk build"

  nix_expression {
    file  = "release.nix"
    input = "uuagcSrc"
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
    value             = "i686-linux"
    notify_committers = false
  }

  input {
    name              = "tarball"
    type              = "build"
    value             = "tarball"
    notify_committers = false
  }

  input {
    name              = "uuagcSrc"
    type              = "svn"
    value             = "https://subversion.cs.uu.nl/repos/project.STEC.uuagc/uuagc/trunk/"
    notify_committers = false
  }

  input {
    name              = "uulib_i686"
    type              = "build"
    value             = "uulib:trunk:build [system = \"i686-linux\"]"
    notify_committers = false
  }

  input {
    name              = "uulib_x64"
    type              = "build"
    value             = "uulib:trunk:build [system = \"x86_64-linux\"]"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "ariem@cs.uu.nl"
}
