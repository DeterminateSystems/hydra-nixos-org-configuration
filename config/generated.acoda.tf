resource "hydra_project" "acoda" {
  name         = "acoda"
  display_name = "Acoda"
  homepage     = "http://swerl.tudelft.nl/bin/view/Acoda"
  description  = "Acoda is a tool set for automatic data migration along an evolving data model"
  owner        = "sander"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "acoda_trunk" {
  project     = hydra_project.acoda.name
  state       = "disabled"
  visible     = false
  name        = "trunk"
  type        = "legacy"
  description = "Acoda trunk"

  nix_expression {
    file  = "trunk.nix"
    input = "acodaSrc"
  }

  input {
    name              = "acodaSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/structure-evolution/trunk"
    notify_committers = false
  }

  input {
    name              = "nixos"
    type              = "git"
    value             = "https://github.com/NixOS/nixos.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git"
    notify_committers = false
  }

  input {
    name              = "services"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/services/trunk"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "i686-linux"
    notify_committers = false
  }

  input {
    name              = "webdslBuild"
    type              = "sysbuild"
    value             = "webdsl:trunk:build"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}
