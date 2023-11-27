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
  state       = "UNKNOWN"
  visible     = 
  name        = "reposearch-app"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}

resource "hydra_jobset" "webdsl_separate-compilation" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = false
  name        = "separate-compilation"
  type        = "legacy"
  description = "WebDSL trunk"

  nix_expression {
    file  = "release.nix"
    input = "webdslsSrc"
  }

  input {
    name              = "buildJava"
    type              = "build"
    value             = "buildJava"
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
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "services"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/services/trunk"
    notify_committers = false
  }

  input {
    name              = "strcJava"
    type              = "build"
    value             = "strategoxt-java:strc-java-trunk:build  [system=\"i686-linux\"]"
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
    name              = "webdslsSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdsls/trunk"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "rob.vermaas@gmail.com"
}

resource "hydra_jobset" "webdsl_trunk" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = true
  name        = "trunk"
  type        = "legacy"
  description = "WebDSL trunk"

  nix_expression {
    file  = "release.nix"
    input = "webdslsSrc"
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
    type              = "build"
    value             = "strategoxt-java:strc-java-trunk:build  [system=\"i686-linux\"]"
    notify_committers = false
  }

  input {
    name              = "webdslsSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdsls/trunk"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = true
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
  description = "WebDSL editor uses webdsl:trunk:buildJava and unstable spoofax release"

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
    value             = "false"
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
  description = "WebDSL editor, uses the faster build output from webdsl:trunk:buildJavaNoCheck"

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
    value             = "false"
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
    value             = "webdsl:trunk:buildJavaNoCheck"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
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
  description = "WebDSL editor for the the webservice branch"

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
    value             = "false"
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
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdsl-editor/branch/WebServices/"
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

resource "hydra_jobset" "webdsl_webdsl-test-production-apps" {
  project     = hydra_project.webdsl.name
  state       = "disabled"
  visible     = true
  name        = "webdsl-test-production-apps"
  type        = "legacy"
  description = "researchr.org/webdsl continious integration builds"

  nix_expression {
    file  = "webdsl/tests.nix"
    input = "hydraConfig"
  }

  input {
    name              = "QASrc"
    type              = "git"
    value             = "https://github.com/webdsl/qa.git master 1"
    notify_committers = false
  }

  input {
    name              = "blogSrc"
    type              = "git"
    value             = "https://github.com/eelcovisser/blog.git master"
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
    value             = "https://github.com/NixOS/nixos.git master"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git master"
    notify_committers = false
  }

  input {
    name              = "pdfInspectorSrc"
    type              = "git"
    value             = "https://github.com/webdsl/pdf-inspector.git master"
    notify_committers = false
  }

  input {
    name              = "reposearchSrc"
    type              = "git"
    value             = "https://github.com/webdsl/reposearch.git master"
    notify_committers = false
  }

  input {
    name              = "services"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/services/trunk"
    notify_committers = false
  }

  input {
    name              = "shopSrc"
    type              = "git"
    value             = "https://github.com/eelcovisser/shop.git master"
    notify_committers = false
  }

  input {
    name              = "webdsl"
    type              = "build"
    value             = "webdsl:trunk:buildJava"
    notify_committers = false
  }

  input {
    name              = "webdslorgSrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdslorg/trunk"
    notify_committers = false
  }

  input {
    name              = "wordSearchSrc"
    type              = "git"
    value             = "https://github.com/Elmervc/wordsearch.git master"
    notify_committers = false
  }

  input {
    name              = "yellowgrassSrc"
    type              = "git"
    value             = "https://github.com/webdsl/yellowgrass.git master 1"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
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
    value             = "https://svn.strategoxt.org/repos/WebDSL/webdsls/branch/query-optimization"
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
