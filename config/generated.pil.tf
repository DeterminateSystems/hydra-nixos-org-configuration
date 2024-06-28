resource "hydra_project" "pil" {
  name         = "pil"
  display_name = "PIL"
  homepage     = ""
  description  = "PIL"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "pil_pil-trunk" {
  project     = hydra_project.pil.name
  state       = "disabled"
  visible     = true
  name        = "pil-trunk"
  type        = "legacy"
  description = "PIL trunk"

  nix_expression {
    file  = "jobs/pil.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra/"
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
    name              = "pilCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/pil/trunk"
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
