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
  state       = "UNKNOWN"
  visible     = 
  name        = "aspectj-front-syntax-trunk"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}

resource "hydra_jobset" "strategoxt-docs_java-front-syntax-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "java-front-syntax-trunk"
  type        = "legacy"
  description = "Java-Front Syntax Definitions"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/java-front/trunk/syntax/src"
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
    value             = "java-front-syntax"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "Java-Front Syntax Definitions"
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

resource "hydra_jobset" "strategoxt-docs_jimple-front-syntax-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "jimple-front-syntax-trunk"
  type        = "legacy"
  description = "Jimple-Front Syntax Definitions"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/sootxt/jimple-front/trunk/syn"
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
    value             = "jimple-front-syntax"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "Jimple-Front Syntax Definitions"
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

resource "hydra_jobset" "strategoxt-docs_libdryad-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "libdryad-docs-trunk"
  type        = "legacy"
  description = "Dryad API Documentation"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/dryad/trunk/lib"
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
    value             = "libdryad-docs"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "Dryad API Documentation"
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

resource "hydra_jobset" "strategoxt-docs_libphp-front-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "libphp-front-docs-trunk"
  type        = "legacy"
  description = "Stratego PHP Front API Documentation"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/psat/php-front/trunk/src/lib"
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
    value             = "libphp-front-docs"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "Stratego PHP Front API Documentation"
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
  visible     = true
  name        = "libstratego-sglr-docs-trunk"
  type        = "legacy"
  description = "Stratego SGLR API Documentation"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt/trunk/stratego-libraries/sglr/lib"
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
    value             = "libstratego-sglr-docs"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "Stratego SGLR API Documentation"
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

resource "hydra_jobset" "strategoxt-docs_libstratego-xtc-docs-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "libstratego-xtc-docs-trunk"
  type        = "legacy"
  description = "Stratego XTC API Documentation"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt/trunk/stratego-libraries/xtc/lib"
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
    value             = "libstratego-xtc-docs"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "Stratego XTC Library API Documentation"
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

resource "hydra_jobset" "strategoxt-docs_php-front-syntax-trunk" {
  project     = hydra_project.strategoxt-docs.name
  state       = "disabled"
  visible     = true
  name        = "php-front-syntax-trunk"
  type        = "legacy"
  description = "PHP Front Syntax Definitions"

  nix_expression {
    file  = "docs.nix"
    input = "hydraConfig"
  }

  input {
    name              = "checkout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/psat/php-front/trunk/src/grammar"
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
    value             = "php-front-syntax"
    notify_committers = false
  }

  input {
    name              = "title"
    type              = "string"
    value             = "PHP Front Syntax Definitions"
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
