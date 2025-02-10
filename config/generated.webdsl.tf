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

resource "hydra_jobset" "webdsl_separate-compilation" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "separate-compilation"
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

resource "hydra_jobset" "webdsl_trunk" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "trunk"
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

resource "hydra_jobset" "webdsl_web-check-test" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "web-check-test"
  type        = "legacy"
  description = "succeed-web test-suite"

  nix_expression {
    file  = "share/webdsl/webdsl-check/test/succeed-web/webtests.nix"
    input = "webdsl"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
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
    value             = "https://github.com/NixOS/nixpkgs.git release-13.10"
    notify_committers = false
  }

  input {
    name              = "services"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/services/trunk"
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

resource "hydra_jobset" "webdsl_webdsl-editor" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "webdsl-editor"
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

resource "hydra_jobset" "webdsl_webdsl-editor-nightly-spoofax" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "webdsl-editor-nightly-spoofax"
  type        = "legacy"
  description = "WebDSL editor for webdsl.org/update/nightly including the nightly of spoofax"

  nix_expression {
    file  = "webdsl/editor.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "nightly"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "webdslEditor"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdsl-editor/trunk"
    notify_committers = false
  }

  input {
    name              = "webdslJava"
    type              = "build"
    value             = "webdsl:trunk:buildJava"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "webdsl_webdsl-editor-no-check" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "webdsl-editor-no-check"
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

resource "hydra_jobset" "webdsl_webdsl-editor-webservices-branch" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "webdsl-editor-webservices-branch"
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

resource "hydra_jobset" "webdsl_webdsl-test-production-apps" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "webdsl-test-production-apps"
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

resource "hydra_jobset" "webdsl_webdsl-tests-query-optimization" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "webdsl-tests-query-optimization"
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

resource "hydra_jobset" "webdsl_webdsl-tests-search" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "webdsl-tests-search"
  type        = "legacy"
  description = "researchr.org/webdsl continious integration builds"

  nix_expression {
    file  = "webdsl/tests-separate-compilation.nix"
    input = "hydraConfig"
  }

  input {
    name              = "feedbackSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/feedback/trunk"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
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
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "researchrSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/researchr/trunk"
    notify_committers = false
  }

  input {
    name              = "services"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/services/trunk"
    notify_committers = false
  }

  input {
    name              = "webdsl"
    type              = "build"
    value             = "webdsl:trunk:build[system=\"i686-linux\"]"
    notify_committers = false
  }

  input {
    name              = "webdslSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdsls/branch/search"
    notify_committers = false
  }

  input {
    name              = "webdslorgSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdslorg/trunk"
    notify_committers = false
  }

  input {
    name              = "yellowgrassSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/issolar/trunk"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "webdsl_webdsl-tests-separate-compilation" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "webdsl-tests-separate-compilation"
  type        = "legacy"
  description = "researchr.org/webdsl continious integration builds"

  nix_expression {
    file  = "webdsl/tests-separate-compilation.nix"
    input = "hydraConfig"
  }

  input {
    name              = "feedbackSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/feedback/trunk"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
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
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "researchrSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/researchr/trunk"
    notify_committers = false
  }

  input {
    name              = "services"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/services/trunk"
    notify_committers = false
  }

  input {
    name              = "webdsl"
    type              = "build"
    value             = "webdsl:trunk:build[system=\"i686-linux\"]"
    notify_committers = false
  }

  input {
    name              = "webdslSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdsls/branch/separate-compilation"
    notify_committers = false
  }

  input {
    name              = "webdslorgSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdslorg/trunk"
    notify_committers = false
  }

  input {
    name              = "yellowgrassSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/issolar/trunk"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
