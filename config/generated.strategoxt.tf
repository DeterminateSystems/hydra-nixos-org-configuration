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
  state       = "UNKNOWN"
  visible     = 
  name        = "aster-trunk"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
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

resource "hydra_jobset" "strategoxt_stratego-shell-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "stratego-shell-trunk"
  type        = "legacy"
  description = "Stratego Shell"

  nix_expression {
    file  = "jobs/stratego-shell.nix"
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
    name              = "strategoShellCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/stratego-shell/trunk"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "i686-freebsd"
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

resource "hydra_jobset" "strategoxt_strategoxt-embedded-cs-bootstrap" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = true
  name        = "strategoxt-embedded-cs-bootstrap"
  type        = "legacy"
  description = "StrategoXT Embedded concrete syntax branch"

  nix_expression {
    file  = "jobs/strategoxt-bootstrap.nix"
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
    name              = "strategoxtCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt/branches/strategoxt-embedded-cs"
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

resource "hydra_jobset" "strategoxt_strategoxt-packages" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "strategoxt-packages"
  type        = "legacy"
  description = "StrategoXT integration builds"

  nix_expression {
    file  = "jobs/strategoxt-packages.nix"
    input = "hydraConfig"
  }

  input {
    name              = "aspectjFrontTarball"
    type              = "build"
    value             = "strategoxt-java:aspectj-front-trunk:tarball"
    notify_committers = false
  }

  input {
    name              = "asterTarball"
    type              = "build"
    value             = "strategoxt:aster-trunk:tarball"
    notify_committers = false
  }

  input {
    name              = "dryadTarball"
    type              = "build"
    value             = "strategoxt-java:dryad-trunk:tarball"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "javaFrontTarball"
    type              = "build"
    value             = "strategoxt-java:java-front-trunk:tarball"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "strategoxtTarball"
    type              = "build"
    value             = "strategoxt:strategoxt-release:tarball"
    notify_committers = false
  }

  input {
    name              = "strategoxtUtilsTarball"
    type              = "build"
    value             = "strategoxt:strategoxt-utils-trunk:tarball"
    notify_committers = false
  }

  input {
    name              = "strcJavaTarball"
    type              = "build"
    value             = "strategoxt-java:strc-java-trunk:tarball"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "i686-freebsd"
    notify_committers = false
  }

  input {
    name              = "xdocTarball"
    type              = "build"
    value             = "strategoxt:xdoc-trunk:tarball"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "strategoxt_strategoxt-release" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "strategoxt-release"
  type        = "legacy"
  description = "StrategoXT release"

  nix_expression {
    file  = "jobs/strategoxt-bootstrap.nix"
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
    name              = "strategoxtCheckout"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "i686-freebsd"
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

resource "hydra_jobset" "strategoxt_strategoxt-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "strategoxt-trunk"
  type        = "legacy"
  description = "StrategoXT trunk"

  nix_expression {
    file  = "jobs/strategoxt.nix"
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
    name              = "system"
    type              = "string"
    value             = "i686-linux"
    notify_committers = false
  }

  input {
    name              = "tarball"
    type              = "build"
    value             = "strategoxt:strategoxt-release:tarball"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "strategoxt_strategoxt-utils-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "strategoxt-utils-trunk"
  type        = "legacy"
  description = "StrategoXT utils"

  nix_expression {
    file  = "jobs/strategoxt-utils.nix"
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
    name              = "strategoxtUtilsCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt-utils/trunk"
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

resource "hydra_jobset" "strategoxt_xdoc-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "xdoc-trunk"
  type        = "legacy"
  description = "xDoc"

  nix_expression {
    file  = "jobs/xdoc.nix"
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
    name              = "strategoxtUtils"
    type              = "build"
    value             = "strategoxt-utils-trunk:build [system=\"i686-linux\"]"
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
    name              = "xdocCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/xdoc/trunk"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}
