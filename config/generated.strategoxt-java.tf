resource "hydra_project" "strategoxt-java" {
  name         = "strategoxt-java"
  display_name = "StrategoXT Java"
  homepage     = "http://www.strategoxt.org"
  description  = "StrategoXT Java packages"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "strategoxt-java_aspectj-front-trunk" {
  project     = hydra_project.strategoxt-java.name
  state       = "disabled"
  visible     = false
  name        = "aspectj-front-trunk"
  type        = "legacy"
  description = "AspectJ Front"

  nix_expression {
    file  = "jobs/aspectj-front.nix"
    input = "hydraConfig"
  }

  input {
    name              = "aspectjFrontCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/aspectj-front/trunk"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
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
    value             = "i686-cygwin"
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

