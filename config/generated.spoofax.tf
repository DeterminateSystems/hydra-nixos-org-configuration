resource "hydra_project" "spoofax" {
  name         = "spoofax"
  display_name = "Spoofax"
  homepage     = "http://spoofax.org"
  description  = "Spoofax related projects"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "spoofax_plasticode" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "plasticode"
  type        = "legacy"
  description = "Experimental and temporary"

  nix_expression {
    file  = "org.plasticode.releng/package/plasticode.nix"
    input = "plasticode"
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
    name              = "plasticode"
    type              = "hg"
    value             = "https://bitbucket.org/karltk/plasticode"
    notify_committers = false
  }

  input {
    name              = "spoofax"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/"
    notify_committers = false
  }

  input {
    name              = "strategoxtJavaBackend"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt-java-backend/trunk"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

