resource "hydra_project" "mobl" {
  name         = "mobl"
  display_name = "Mobl"
  homepage     = "http://mobl-lang.org"
  description  = "Mobl"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "mobl_master" {
  project     = hydra_project.mobl.name
  state       = "disabled"
  visible     = true
  name        = "master"
  type        = "legacy"
  description = "Mobl master branch"

  nix_expression {
    file  = "release.nix"
    input = "mobl"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "mobl"
    type              = "git"
    value             = "https://github.com/mobl/mobl.git"
    notify_committers = false
  }

  input {
    name              = "moblPlugin"
    type              = "git"
    value             = "https://github.com/mobl/mobl-plugin.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "webdslzips"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdsl-eclipse-zips/trunk"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
