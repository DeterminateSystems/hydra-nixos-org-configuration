resource "hydra_project" "strategoxt-docs" {
  name         = "strategoxt-docs"
  display_name = "StrategoXT documentation"
  homepage     = "http://www.strategoxt.org"
  description  = "StrategoXT documentation"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "strategoxt-docs_aspectj-front-syntax-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "aspectj-front-syntax-trunk"
  type        = "legacy"
  description = "AspectJ Front Syntax Definitions"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/aspectj-front/trunk/syntax/src"
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
    name              = "packageName"
    type              = "string"
    value             = "aspectj-front-syntax"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "AspectJ Front Syntax Definitions"
    notify_committers = false
  }

  input {
    name              = "xdoc"
    type              = "build"
    value             = "strategoxt:xdoc-trunk:build [system=\"i686-linux\"]"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = true
  email_override      = ""
}

