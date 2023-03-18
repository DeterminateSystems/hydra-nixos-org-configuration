resource "hydra_project" "psat" {
  name         = "psat"
  display_name = "PSAT"
  homepage     = "http://www.program-transformation.org/PHP/"
  description  = "PHP analysis tools"
  owner        = "eelco"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "psat_php-front" {
  project     = hydra_project.psat.name
  state       = "disabled"
  visible     = false
  name        = "php-front"
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

resource "hydra_jobset" "psat_php-sat" {
  project     = hydra_project.psat.name
  state       = "disabled"
  visible     = true
  name        = "php-sat"
  type        = "legacy"
  description = "Static analysis tool for PHP"

  nix_expression {
    file  = "release.nix"
    input = "phpsatSrc"
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
    name              = "phpfront"
    type              = "build"
    value             = "php-front:build [system = \"i686-linux\"]"
    notify_committers = false
  }

  input {
    name              = "phpsatSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/psat/php-sat/trunk"
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

resource "hydra_jobset" "psat_php-tools" {
  project     = hydra_project.psat.name
  state       = "disabled"
  visible     = true
  name        = "php-tools"
  type        = "legacy"
  description = "Tools for analysing PHP code"

  nix_expression {
    file  = "release.nix"
    input = "phptoolsSrc"
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
    name              = "phpfront"
    type              = "build"
    value             = "php-front:build [system = \"i686-linux\"]"
    notify_committers = false
  }

  input {
    name              = "phptoolsSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/psat/php-tools/trunk"
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
