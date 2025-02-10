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
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "strategoxt_ecmascript-front-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "ecmascript-front-trunk"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
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
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
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
  visible     = false
  name        = "strategoxt-embedded-cs-bootstrap"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "strategoxt_strategoxt-packages" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "strategoxt-packages"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
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
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "strategoxt_strategoxt-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "strategoxt-trunk"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "strategoxt_strategoxt-utils-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "strategoxt-utils-trunk"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "strategoxt_xdoc-trunk" {
  project     = hydra_project.strategoxt.name
  state       = "disabled"
  visible     = false
  name        = "xdoc-trunk"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
