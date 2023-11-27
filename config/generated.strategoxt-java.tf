resource "hydra_project" "strategoxt-java" {
  name         = "strategoxt-java"
  display_name = "StrategoXT Java"
  homepage     = "http://www.strategoxt.org"
  description  = "StrategoXT Java packages"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "strategoxt-java_aspectj-front-trunk" {
  project     = hydra_project.strategoxt-java.name
  state       = "UNKNOWN"
  visible     = 
  name        = "aspectj-front-trunk"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}

resource "hydra_jobset" "strategoxt-java_dryad-compiler-trunk" {
  project     = hydra_project.strategoxt-java.name
  state       = "disabled"
  visible     = false
  name        = "dryad-compiler-trunk"
  type        = "legacy"
  description = "Dryad Compiler"

  nix_expression {
    file  = "jobs/dryad-compiler.nix"
    input = "hydraConfig"
  }

  input {
    name              = "dryad"
    type              = "sysbuild"
    value             = "dryad-trunk:build"
    notify_committers = false
  }

  input {
    name              = "dryadCompilerCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/dryad-compiler/trunk"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "javaFront"
    type              = "sysbuild"
    value             = "java-front-trunk:build"
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

resource "hydra_jobset" "strategoxt-java_dryad-trunk" {
  project     = hydra_project.strategoxt-java.name
  state       = "disabled"
  visible     = false
  name        = "dryad-trunk"
  type        = "legacy"
  description = "Dryad"

  nix_expression {
    file  = "jobs/dryad.nix"
    input = "hydraConfig"
  }

  input {
    name              = "dryadCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/dryad/trunk"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "javaFront"
    type              = "sysbuild"
    value             = "java-front-trunk:build"
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
    value             = "x86_64-darwin"
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

resource "hydra_jobset" "strategoxt-java_java-front-trunk" {
  project     = hydra_project.strategoxt-java.name
  state       = "disabled"
  visible     = false
  name        = "java-front-trunk"
  type        = "legacy"
  description = "JavaFront"

  nix_expression {
    file  = "jobs/java-front.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "javaFrontCheckout"
    type              = "git"
    value             = "https://github.com/metaborg/java-front.git"
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

resource "hydra_jobset" "strategoxt-java_jimple-front-trunk" {
  project     = hydra_project.strategoxt-java.name
  state       = "disabled"
  visible     = false
  name        = "jimple-front-trunk"
  type        = "legacy"
  description = "Jimple Front"

  nix_expression {
    file  = "jobs/jimple-front.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "jimpleFrontCheckout"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/sootxt/jimple-front/trunk"
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

resource "hydra_jobset" "strategoxt-java_strategoxt-java-bootstrap" {
  project     = hydra_project.strategoxt-java.name
  state       = "disabled"
  visible     = false
  name        = "strategoxt-java-bootstrap"
  type        = "legacy"
  description = "Stratego/XT distribution for Java"

  nix_expression {
    file  = "strategoxt/strategoxt-java-bootstrap.nix"
    input = "strategoxtJava"
  }

  input {
    name              = "javaFront"
    type              = "git"
    value             = "https://github.com/metaborg/java-front.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "strategoxtJava"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git java-bootstrap"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "v.a.vergu@tudelft.nl, xrj3dctbrf3a@bxc.io"
}

resource "hydra_jobset" "strategoxt-java_strategoxt-typesmart" {
  project     = hydra_project.strategoxt-java.name
  state       = "disabled"
  visible     = false
  name        = "strategoxt-typesmart"
  type        = "legacy"
  description = "Stratego/XT distribution for Java"

  nix_expression {
    file  = "jobs/strategoxt-java-bootstrap.nix"
    input = "hydraConfig"
  }

  input {
    name              = "baseline"
    type              = "sysbuild"
    value             = "strategoxt-java:strategoxt-java-bootstrap:bootstrap3"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "javaFront"
    type              = "git"
    value             = "https://github.com/metaborg/java-front.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "strategoxtJava"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git typesmart-library"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "v.vergu@gmail.com"
}

resource "hydra_jobset" "strategoxt-java_strc-java-trunk" {
  project     = hydra_project.strategoxt-java.name
  state       = "disabled"
  visible     = false
  name        = "strc-java-trunk"
  type        = "legacy"
  description = "Stratego-to-Java compiler"

  nix_expression {
    file  = "jobs/strc-java.nix"
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
    name              = "strcJavaCheckout"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git"
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

resource "hydra_jobset" "strategoxt-java_strc-javascript-trunk" {
  project     = hydra_project.strategoxt-java.name
  state       = "disabled"
  visible     = false
  name        = "strc-javascript-trunk"
  type        = "legacy"
  description = "Stratego-to-JavaScript compiler"

  nix_expression {
    file  = "jobs/strategoxt-javascript-backend.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "jsbackend"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt-javascript-backend/trunk"
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
    name              = "strategoxt"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git java-bootstrap"
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

resource "hydra_jobset" "strategoxt-java_strj-frontend-refactor" {
  project     = hydra_project.strategoxt-java.name
  state       = "disabled"
  visible     = false
  name        = "strj-frontend-refactor"
  type        = "legacy"
  description = "Stratego/XT distribution for Java"

  nix_expression {
    file  = "strategoxt/strategoxt-java-bootstrap.nix"
    input = "strategoxtJava"
  }

  input {
    name              = "javaFront"
    type              = "git"
    value             = "https://github.com/metaborg/java-front.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "strategoxtJava"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git strj-front-end-refactor"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "v.a.vergu@tudelft.nl, e.visser@tudelft.nl, xrj3dctbrf3a@bxc.io"
}
