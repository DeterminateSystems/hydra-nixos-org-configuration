resource "hydra_project" "meta-environment" {
  name         = "meta-environment"
  display_name = "Meta Environment"
  homepage     = "http://www.meta-environment.org"
  description  = "Meta Environment"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "meta-environment_aterm-trunk" {
  project     = hydra_project.meta-environment.name
  state       = "disabled"
  visible     = true
  name        = "aterm-trunk"
  type        = "legacy"
  description = "ATerm trunk"

  nix_expression {
    file  = "jobs/aterm.nix"
    input = "hydraConfig"
  }

  input {
    name              = "atermCheckout"
    type              = "svn"
    value             = "svn+ssh://svn.cwi.nl/aterm/trunk"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "metaBuildEnv"
    type              = "build"
    value             = "meta-build-env-trunk:build [system=\"i686-linux\"]"
    notify_committers = false
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

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

