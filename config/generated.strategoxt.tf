resource "hydra_project" "strategoxt" {
  name         = "strategoxt"
  display_name = "StrategoXT"
  homepage     = "http://www.strategoxt.org"
  description  = "StrategoXT"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "strategoxt_aster-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "aster-trunk"
  type        = "legacy"
  description = "Aster"

  nix_expression {
    file  = "jobs/aster.nix"
    input = "hydraConfig"
  }

  input {
    name              = "asterCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/aster/trunk"
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
    name              = "strcJava"
    type              = "sysbuild"
    value             = "strategoxt-java:strc-java-trunk:build"
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

resource "hydra_jobset" "strategoxt_ecmascript-front-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "ecmascript-front-trunk"
  type        = "legacy"
  description = "ECMAscript Front"

  nix_expression {
    file  = "jobs/ecmascript-front.nix"
    input = "hydraConfig"
  }

  input {
    name              = "ecmascriptFrontCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/ecmascript/ecmascript-front/trunk/"
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

resource "hydra_jobset" "strategoxt_prolog-tools-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "prolog-tools-trunk"
  type        = "legacy"
  description = "Prolog Tools"

  nix_expression {
    file  = "jobs/prolog-tools.nix"
    input = "hydraConfig"
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
    name              = "prologToolsCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/prolog-tools/trunk"
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

resource "hydra_jobset" "strategoxt_stratego-libraries-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "stratego-libraries-trunk"
  type        = "legacy"
  description = "StrategoXT Libraries"

  nix_expression {
    file  = "jobs/stratego-libraries.nix"
    input = "hydraConfig"
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
    name              = "std"
    type              = "string"
    value             = ""
    notify_committers = false
  }

  input {
    name              = "strategoLibrariesCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt/trunk/stratego-libraries"
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

