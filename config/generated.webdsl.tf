resource "hydra_project" "webdsl" {
  name         = "webdsl"
  display_name = "WebDSL"
  homepage     = "http://webdsl.org/"
  description  = "A domain-specific language for developing dynamic web applications with a rich data model"
  owner        = "danny"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "webdsl_reposearch-app" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = true
  name        = "reposearch-app"
  type        = "legacy"
  description = "Reposearch as standalone Java application"

  nix_expression {
    file  = "create-java-app.nix"
    input = "reposearchSrc"
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
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "reposearchSrc"
    type              = "git"
    value             = "https://github.com/webdsl/reposearch.git"
    notify_committers = false
  }

  input {
    name              = "webdsl"
    type              = "build"
    value             = "webdsl:trunk:buildJavaNoCheck"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

