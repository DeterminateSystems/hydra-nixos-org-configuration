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

resource "hydra_jobset" "strategoxt-docs_java-front-syntax-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = false
  name        = "java-front-syntax-trunk"
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

resource "hydra_jobset" "strategoxt-docs_jimple-front-syntax-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = false
  name        = "jimple-front-syntax-trunk"
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

resource "hydra_jobset" "strategoxt-docs_libdryad-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = false
  name        = "libdryad-docs-trunk"
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

resource "hydra_jobset" "strategoxt-docs_libphp-front-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = false
  name        = "libphp-front-docs-trunk"
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

resource "hydra_jobset" "strategoxt-docs_libstratego-gpp-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "libstratego-gpp-docs-trunk"
  type        = "legacy"
  description = "Stratego GPP API Documentation"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt/trunk/stratego-libraries/gpp/lib"
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
    value             = "libstratego-gpp-docs"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "Stratego GPP API Documentation"
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

resource "hydra_jobset" "strategoxt-docs_libstratego-lib-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "libstratego-lib-docs-trunk"
  type        = "legacy"
  description = "Stratego Libraries API Documentation trunk"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt/trunk/stratego-libraries/lib/spec"
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
    value             = "libstratego-lib-docs"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "Stratego Library API Documentation"
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

resource "hydra_jobset" "strategoxt-docs_libstratego-rtg-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "libstratego-rtg-docs-trunk"
  type        = "legacy"
  description = "Stratego RTG API Documentation"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt/trunk/stratego-libraries/rtg/lib"
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
    value             = "libstratego-rtg-docs"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "Stratego RTG API Documentation"
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

resource "hydra_jobset" "strategoxt-docs_libstratego-sglr-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = false
  name        = "libstratego-sglr-docs-trunk"
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

resource "hydra_jobset" "strategoxt-docs_libstratego-xtc-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = false
  name        = "libstratego-xtc-docs-trunk"
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

resource "hydra_jobset" "strategoxt-docs_php-front-syntax-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = false
  name        = "php-front-syntax-trunk"
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

resource "hydra_jobset" "strategoxt-docs_sdf-library-syntax-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = false
  name        = "sdf-library-syntax-trunk"
  type        = "legacy"
  description = "SDF Library Syntax Definitions"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "svn+ssh://svn.cwi.nl/sdf-library/trunk/library"
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
    value             = "sdf-library-syntax"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "SDF Library Syntax Definitions"
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
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "strategoxt-docs_strategoxt-manual" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "strategoxt-manual"
  type        = "legacy"
  description = "StrategoXT manual"

  nix_expression {
    file  = "jobs/strategoxt-manual.nix"
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
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "strategoxt"
    type              = "build"
    value             = "strategoxt:strategoxt-trunk:build [system=\"x86_64-linux\"]"
    notify_committers = false
  }

  input {
    name              = "strategoxtManualCheckout"
    type              = "git"
    value             = "https://github.com/rbvermaa/strategoxt-manual"
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
  keep_evaluations  = 1

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "strategoxt-docs_xdoc-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "xdoc-docs-trunk"
  type        = "legacy"
  description = "xDoc API documentation"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/xdoc/trunk/src"
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
    value             = "xdoc-docs"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "xDoc API Documentation"
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
