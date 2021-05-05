resource "hydra_project" "spoofax" {
  name         = "spoofax"
  display_name = "Spoofax"
  homepage     = "http://spoofax.org"
  description  = "Spoofax related projects"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "spoofax_plasticode" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "plasticode"
  type        = "legacy"
  description = "Experimental and temporary"

  nix_expression {
    file  = "org.plasticode.releng/package/plasticode.nix"
    input = "plasticode"
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
    name              = "plasticode"
    type              = "hg"
    value             = "https://bitbucket.org/karltk/plasticode"
    notify_committers = false
  }

  input {
    name              = "spoofax"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/"
    notify_committers = false
  }

  input {
    name              = "strategoxtJavaBackend"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt-java-backend/trunk"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "spoofax_runtime-libraries" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "runtime-libraries"
  type        = "legacy"
  description = "Build runtime libraries into Stratego ctrees and jars"

  nix_expression {
    file  = "org.spoofax.meta.runtime.libraries/build.nix"
    input = "runtime-libraries"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "runtime-libraries"
    type              = "git"
    value             = "https://github.com/metaborg/runtime-libraries.git"
    notify_committers = false
  }

  input {
    name              = "strategoxt"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "strj"
    type              = "sysbuild"
    value             = "strategoxt-java:strategoxt-java-bootstrap:bootstrap3"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "g.d.p.konat@tudelft.nl"
}

resource "hydra_jobset" "spoofax_spoofax-ace" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-ace"
  type        = "legacy"
  description = "Spoofax project to ace editor"

  nix_expression {
    file  = "jobs/spoofax-ace.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "jssglr"
    type              = "sysbuild"
    value             = "spoofax:spoofax-jssglr:build"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "spoofaxacesrc"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax-ace/trunk/spoofax-ace/"
    notify_committers = false
  }

  input {
    name              = "strategoxtJavaBackend"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt-java-backend/trunk"
    notify_committers = false
  }

  input {
    name              = "strategoxtJavaScriptBackend"
    type              = "sysbuild"
    value             = "strategoxt-java:strc-javascript-trunk:build"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "spoofax_spoofax-aterm" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-aterm"
  type        = "legacy"
  description = "Spoofax ATerm"

  nix_expression {
    file  = "jobs/org.spoofax.aterm.nix"
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
    name              = "spoofaxATerm"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/org.spoofax.aterm"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "spoofax_spoofax-interpreter" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-interpreter"
  type        = "legacy"
  description = "Spoofax Command Line Interpreter"

  nix_expression {
    file  = "jobs/spoofax-interpreter.nix"
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
    name              = "spoofaxCore"
    type              = "sysbuild"
    value             = "spoofax:spoofax-interpreter-core:build"
    notify_committers = false
  }

  input {
    name              = "spoofaxInterpreter"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/org.spoofax.interpreter"
    notify_committers = false
  }

  input {
    name              = "spoofaxJsglr"
    type              = "sysbuild"
    value             = "spoofax:spoofax-jsglr:build"
    notify_committers = false
  }

  input {
    name              = "spoofaxLibraryJsglr"
    type              = "sysbuild"
    value             = "spoofax:spoofax-interpreter-library-jsglr:build"
    notify_committers = false
  }

  input {
    name              = "spoofaxTerms"
    type              = "sysbuild"
    value             = "spoofax:spoofax-terms:build"
    notify_committers = false
  }

  input {
    name              = "strategoxt"
    type              = "sysbuild"
    value             = "strategoxt:strategoxt-trunk:build"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "spoofax_spoofax-interpreter-core" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-interpreter-core"
  type        = "legacy"
  description = "Spoofax Interpreter Core"

  nix_expression {
    file  = "jobs/org.spoofax.interpreter.core.nix"
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
    name              = "spoofaxCore"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/org.spoofax.interpreter.core"
    notify_committers = false
  }

  input {
    name              = "spoofaxTerms"
    type              = "sysbuild"
    value             = "spoofax:spoofax-terms:build"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "spoofax_spoofax-interpreter-library-jsglr" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-interpreter-library-jsglr"
  type        = "legacy"
  description = "Spoofax Library for JSGLR"

  nix_expression {
    file  = "jobs/org.spoofax.interpreter.library.jsglr.nix"
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
    name              = "spoofaxCore"
    type              = "sysbuild"
    value             = "spoofax:spoofax-interpreter-core:build"
    notify_committers = false
  }

  input {
    name              = "spoofaxJsglr"
    type              = "sysbuild"
    value             = "spoofax:spoofax-jsglr:build"
    notify_committers = false
  }

  input {
    name              = "spoofaxLibraryJsglr"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/org.spoofax.interpreter.library.jsglr/"
    notify_committers = false
  }

  input {
    name              = "spoofaxTerms"
    type              = "sysbuild"
    value             = "spoofax:spoofax-terms:build"
    notify_committers = false
  }

  input {
    name              = "strategoxt"
    type              = "sysbuild"
    value             = "strategoxt:strategoxt-trunk:build"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "spoofax_spoofax-jsglr" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-jsglr"
  type        = "legacy"
  description = "Spoofax SGLR for Java"

  nix_expression {
    file  = "jobs/org.spoofax.jsglr.nix"
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
    name              = "spoofaxJsglr"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/org.spoofax.jsglr"
    notify_committers = false
  }

  input {
    name              = "spoofaxTerms"
    type              = "sysbuild"
    value             = "spoofax:spoofax-terms:build"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "spoofax_spoofax-jssglr" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-jssglr"
  type        = "legacy"
  description = "Spoofax SGLR for JavaScript"

  nix_expression {
    file  = "jobs/org.spoofax.jssglr.nix"
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
    name              = "spoofaxJsglr"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/org.spoofax.jsglr"
    notify_committers = false
  }

  input {
    name              = "spoofaxJssglr"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/org.spoofax.jssglr"
    notify_committers = false
  }

  input {
    name              = "spoofaxTerms"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/org.spoofax.terms"
    notify_committers = false
  }

  input {
    name              = "webworkerBuild"
    type              = "sysbuild"
    value             = "spoofax:webworker:build"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "spoofax_spoofax-master" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-master"
  type        = "legacy"
  description = "Spoofax [master]"

  nix_expression {
    file  = "hydra/spoofax.nix"
    input = "spoofaxDeploy"
  }

  input {
    name              = "aster"
    type              = "git"
    value             = "https://github.com/metaborg/aster.git"
    notify_committers = false
  }

  input {
    name              = "box"
    type              = "git"
    value             = "https://github.com/metaborg/box.git"
    notify_committers = false
  }

  input {
    name              = "esv"
    type              = "git"
    value             = "https://github.com/metaborg/esv.git"
    notify_committers = false
  }

  input {
    name              = "impPatched"
    type              = "git"
    value             = "https://github.com/metaborg/imp-patched.git spoofax"
    notify_committers = false
  }

  input {
    name              = "jsglr"
    type              = "git"
    value             = "https://github.com/metaborg/jsglr.git"
    notify_committers = false
  }

  input {
    name              = "lpgRuntime"
    type              = "git"
    value             = "https://github.com/metaborg/lpg-runtime.git"
    notify_committers = false
  }

  input {
    name              = "mbExec"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec.git"
    notify_committers = false
  }

  input {
    name              = "mbExecDeps"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec-deps.git"
    notify_committers = false
  }

  input {
    name              = "mbRep"
    type              = "git"
    value             = "https://github.com/metaborg/mb-rep.git"
    notify_committers = false
  }

  input {
    name              = "modelware"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-modelware.git"
    notify_committers = false
  }

  input {
    name              = "nabl"
    type              = "git"
    value             = "https://github.com/metaborg/nabl.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "rtg"
    type              = "git"
    value             = "https://github.com/metaborg/rtg.git"
    notify_committers = false
  }

  input {
    name              = "runtimeLibraries"
    type              = "git"
    value             = "https://github.com/metaborg/runtime-libraries.git"
    notify_committers = false
  }

  input {
    name              = "sdf"
    type              = "git"
    value             = "https://github.com/metaborg/sdf.git"
    notify_committers = false
  }

  input {
    name              = "shrike"
    type              = "git"
    value             = "https://github.com/metaborg/shrike.git"
    notify_committers = false
  }

  input {
    name              = "spoofax"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax.git"
    notify_committers = false
  }

  input {
    name              = "spoofaxDebug"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-debug.git"
    notify_committers = false
  }

  input {
    name              = "spoofaxDeploy"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-deploy.git"
    notify_committers = false
  }

  input {
    name              = "spoofaxSunshine"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-sunshine.git"
    notify_committers = false
  }

  input {
    name              = "spt"
    type              = "git"
    value             = "https://github.com/metaborg/spt.git"
    notify_committers = false
  }

  input {
    name              = "stratego"
    type              = "git"
    value             = "https://github.com/metaborg/stratego.git"
    notify_committers = false
  }

  input {
    name              = "strategoxt"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "strategoxtDistrib"
    type              = "sysbuild"
    value             = "strategoxt-java:strategoxt-java-bootstrap:bootstrap3"
    notify_committers = false
  }

  input {
    name              = "ts"
    type              = "git"
    value             = "https://github.com/metaborg/ts.git"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = false
  email_override      = "g.d.p.konat@tudelft.nl, v.a.vergu@tudelft.nl, g.h.Wachsmuth@tudelft.nl, e.visser@tudelft.nl, oskarvanrest@gmail.com, a.passalaquamartins@tudelft.nl, xrj3dctbrf3a@bxc.io"
}

resource "hydra_jobset" "spoofax_spoofax-master-debugger" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-master-debugger"
  type        = "legacy"
  description = "Spoofax [master]"

  nix_expression {
    file  = "jobs/spoofax-git/spoofax-master-debugger.nix"
    input = "hydraConfig"
  }

  input {
    name              = "aster"
    type              = "git"
    value             = "https://github.com/metaborg/aster.git"
    notify_committers = false
  }

  input {
    name              = "box"
    type              = "git"
    value             = "https://github.com/metaborg/box.git"
    notify_committers = false
  }

  input {
    name              = "esv"
    type              = "git"
    value             = "https://github.com/metaborg/esv.git"
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
    value             = "https://github.com/metaborg/java-front.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "jsglr"
    type              = "git"
    value             = "https://github.com/metaborg/jsglr.git"
    notify_committers = false
  }

  input {
    name              = "lpgRuntime"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/sglr-recovery/trunk/lpg.runtime.java"
    notify_committers = false
  }

  input {
    name              = "mbexec"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec.git"
    notify_committers = false
  }

  input {
    name              = "mbexecdeps"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec-deps.git"
    notify_committers = false
  }

  input {
    name              = "mbrep"
    type              = "git"
    value             = "https://github.com/metaborg/mb-rep.git"
    notify_committers = false
  }

  input {
    name              = "metaborgRuntime"
    type              = "git"
    value             = "https://github.com/metaborg/runtime-libraries.git"
    notify_committers = false
  }

  input {
    name              = "nabl"
    type              = "git"
    value             = "https://github.com/metaborg/nabl.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "rtg"
    type              = "git"
    value             = "https://github.com/metaborg/rtg.git"
    notify_committers = false
  }

  input {
    name              = "sdf"
    type              = "git"
    value             = "https://github.com/metaborg/sdf.git"
    notify_committers = false
  }

  input {
    name              = "spoofax"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax.git"
    notify_committers = false
  }

  input {
    name              = "spoofaxdebug"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-debug.git"
    notify_committers = false
  }

  input {
    name              = "spoofaxdeploy"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-deploy.git"
    notify_committers = false
  }

  input {
    name              = "spoofaximppatches"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-imp-patches.git"
    notify_committers = false
  }

  input {
    name              = "spt"
    type              = "git"
    value             = "https://github.com/metaborg/spt.git"
    notify_committers = false
  }

  input {
    name              = "spx"
    type              = "git"
    value             = "https://github.com/metaborg/spx.git"
    notify_committers = false
  }

  input {
    name              = "stratego"
    type              = "git"
    value             = "https://github.com/metaborg/stratego.git"
    notify_committers = false
  }

  input {
    name              = "strategoxt"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "strategoxtCVersion"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git"
    notify_committers = false
  }

  input {
    name              = "strcj"
    type              = "sysbuild"
    value             = "strategoxt-java:strc-java-trunk:build"
    notify_committers = false
  }

  input {
    name              = "strj"
    type              = "sysbuild"
    value             = "strategoxt-java:strategoxt-java-bootstrap:bootstrap3"
    notify_committers = false
  }

  input {
    name              = "tdl"
    type              = "git"
    value             = "https://github.com/metaborg/tdl.git"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "rtlindeman@gmail.com"
}

resource "hydra_jobset" "spoofax_spoofax-mdsd" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-mdsd"
  type        = "legacy"
  description = "Spoofax/IMP trunk (unstable)"

  nix_expression {
    file  = "jobs/spoofax-imp.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra 24969"
    notify_committers = false
  }

  input {
    name              = "lpgRuntime"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/sglr-recovery/trunk/lpg.runtime.java"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "spoofax"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax 24996"
    notify_committers = false
  }

  input {
    name              = "spoofaxImp"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax-imp/trunk 24994"
    notify_committers = false
  }

  input {
    name              = "strategoxtJavaBackend"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/strategoxt-java-backend/trunk 25199"
    notify_committers = false
  }

  input {
    name              = "strcJava"
    type              = "sysbuild"
    value             = "strategoxt-java:strc-java-trunk:build"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "spoofax_spoofax-modelware" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-modelware"
  type        = "legacy"
  description = "Spoofax Modelware [unstable]"

  nix_expression {
    file  = "jobs/spoofax-git/spoofax-master.nix"
    input = "hydraConfig"
  }

  input {
    name              = "aster"
    type              = "git"
    value             = "https://github.com/metaborg/aster.git"
    notify_committers = false
  }

  input {
    name              = "box"
    type              = "git"
    value             = "https://github.com/metaborg/box.git"
    notify_committers = false
  }

  input {
    name              = "esv"
    type              = "git"
    value             = "https://github.com/metaborg/esv.git"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "imppatched"
    type              = "git"
    value             = "https://github.com/metaborg/imp-patched.git spoofax"
    notify_committers = false
  }

  input {
    name              = "javaFront"
    type              = "git"
    value             = "https://github.com/metaborg/java-front.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "jsglr"
    type              = "git"
    value             = "https://github.com/metaborg/jsglr.git"
    notify_committers = false
  }

  input {
    name              = "lpgRuntime"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/sglr-recovery/trunk/lpg.runtime.java"
    notify_committers = false
  }

  input {
    name              = "mbexec"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec.git"
    notify_committers = false
  }

  input {
    name              = "mbexecdeps"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec-deps.git"
    notify_committers = false
  }

  input {
    name              = "mbrep"
    type              = "git"
    value             = "https://github.com/metaborg/mb-rep.git"
    notify_committers = false
  }

  input {
    name              = "metaborgRuntime"
    type              = "git"
    value             = "https://github.com/metaborg/runtime-libraries.git"
    notify_committers = false
  }

  input {
    name              = "modelware"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-modelware.git"
    notify_committers = false
  }

  input {
    name              = "nabl"
    type              = "git"
    value             = "https://github.com/metaborg/nabl.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "rtg"
    type              = "git"
    value             = "https://github.com/metaborg/rtg.git"
    notify_committers = false
  }

  input {
    name              = "sdf"
    type              = "git"
    value             = "https://github.com/metaborg/sdf.git"
    notify_committers = false
  }

  input {
    name              = "shrike"
    type              = "svn"
    value             = "http://wala.svn.sourceforge.net/svnroot/wala/trunk/com.ibm.wala.shrike@3037"
    notify_committers = false
  }

  input {
    name              = "spoofax"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax.git"
    notify_committers = false
  }

  input {
    name              = "spoofaxdebug"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-debug.git"
    notify_committers = false
  }

  input {
    name              = "spoofaxdeploy"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-deploy.git"
    notify_committers = false
  }

  input {
    name              = "spt"
    type              = "git"
    value             = "https://github.com/metaborg/spt.git"
    notify_committers = false
  }

  input {
    name              = "stratego"
    type              = "git"
    value             = "https://github.com/metaborg/stratego.git"
    notify_committers = false
  }

  input {
    name              = "strategoxt"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "strategoxtCVersion"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git"
    notify_committers = false
  }

  input {
    name              = "strcj"
    type              = "sysbuild"
    value             = "strategoxt-java:strc-java-trunk:build"
    notify_committers = false
  }

  input {
    name              = "strj"
    type              = "sysbuild"
    value             = "strategoxt-java:strategoxt-java-bootstrap:bootstrap3"
    notify_committers = false
  }

  input {
    name              = "tdl"
    type              = "git"
    value             = "https://github.com/metaborg/tdl.git"
    notify_committers = false
  }

  input {
    name              = "ts"
    type              = "git"
    value             = "https://github.com/metaborg/ts.git"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "oskarvanrest@gmail.com"
}

resource "hydra_jobset" "spoofax_spoofax-release" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-release"
  type        = "legacy"
  description = "Spoofax [spoofax-release]"

  nix_expression {
    file  = "jobs/spoofax-git/spoofax-release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "aster"
    type              = "git"
    value             = "https://github.com/metaborg/aster.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "box"
    type              = "git"
    value             = "https://github.com/metaborg/box.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "esv"
    type              = "git"
    value             = "https://github.com/metaborg/esv.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "imppatched"
    type              = "git"
    value             = "https://github.com/metaborg/imp-patched.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "javaFront"
    type              = "git"
    value             = "https://github.com/metaborg/java-front.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "jsglr"
    type              = "git"
    value             = "https://github.com/metaborg/jsglr.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "lpgRuntime"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/sglr-recovery/trunk/lpg.runtime.java"
    notify_committers = false
  }

  input {
    name              = "mbexec"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "mbexecdeps"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec-deps.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "mbrep"
    type              = "git"
    value             = "https://github.com/metaborg/mb-rep.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "metaborgRuntime"
    type              = "git"
    value             = "https://github.com/metaborg/runtime-libraries.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "modelware"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-modelware.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "nabl"
    type              = "git"
    value             = "https://github.com/metaborg/nabl.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "rtg"
    type              = "git"
    value             = "https://github.com/metaborg/rtg.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "sdf"
    type              = "git"
    value             = "https://github.com/metaborg/sdf.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "shrike"
    type              = "svn"
    value             = "http://wala.svn.sourceforge.net/svnroot/wala/trunk/com.ibm.wala.shrike@3037"
    notify_committers = false
  }

  input {
    name              = "spoofax"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "spoofaxdebug"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-debug.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "spoofaxdeploy"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-deploy.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "spt"
    type              = "git"
    value             = "https://github.com/metaborg/spt.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "spx"
    type              = "git"
    value             = "https://github.com/metaborg/spx.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "stratego"
    type              = "git"
    value             = "https://github.com/metaborg/stratego.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "strategoxt"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git strj/release-140728"
    notify_committers = false
  }

  input {
    name              = "strategoxtCVersion"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git"
    notify_committers = false
  }

  input {
    name              = "strcj"
    type              = "sysbuild"
    value             = "strategoxt-java:strc-java-trunk:build"
    notify_committers = false
  }

  input {
    name              = "strj"
    type              = "sysbuild"
    value             = "strategoxt-java:strategoxt-java-bootstrap:bootstrap3"
    notify_committers = false
  }

  input {
    name              = "tdl"
    type              = "git"
    value             = "https://github.com/metaborg/tdl.git spoofax-release"
    notify_committers = false
  }

  input {
    name              = "ts"
    type              = "git"
    value             = "https://github.com/metaborg/ts.git spoofax-release"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "spoofax_spoofax-terms" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-terms"
  type        = "legacy"
  description = "Spoofax Term library"

  nix_expression {
    file  = "jobs/org.spoofax.terms.nix"
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
    name              = "spoofaxTerms"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/spoofax/trunk/spoofax/org.spoofax.terms"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "spoofax_spoofax-typesmart" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-typesmart"
  type        = "legacy"
  description = "Spoofax [typesmart]"

  nix_expression {
    file  = "jobs/spoofax-git/spoofax-typesmart.nix"
    input = "hydraConfig"
  }

  input {
    name              = "aster"
    type              = "git"
    value             = "https://github.com/metaborg/aster.git"
    notify_committers = false
  }

  input {
    name              = "box"
    type              = "git"
    value             = "https://github.com/metaborg/box.git"
    notify_committers = false
  }

  input {
    name              = "esv"
    type              = "git"
    value             = "https://github.com/metaborg/esv.git"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "imppatched"
    type              = "git"
    value             = "https://github.com/metaborg/imp-patched.git spoofax"
    notify_committers = false
  }

  input {
    name              = "javaFront"
    type              = "git"
    value             = "https://github.com/metaborg/java-front.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "jsglr"
    type              = "git"
    value             = "https://github.com/metaborg/jsglr.git"
    notify_committers = false
  }

  input {
    name              = "lpgRuntime"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/sglr-recovery/trunk/lpg.runtime.java"
    notify_committers = false
  }

  input {
    name              = "mbexec"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec.git"
    notify_committers = false
  }

  input {
    name              = "mbexecdeps"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec-deps.git"
    notify_committers = false
  }

  input {
    name              = "mbrep"
    type              = "git"
    value             = "https://github.com/metaborg/mb-rep.git typesmart"
    notify_committers = false
  }

  input {
    name              = "metaborgRuntime"
    type              = "git"
    value             = "https://github.com/metaborg/runtime-libraries.git"
    notify_committers = false
  }

  input {
    name              = "modelware"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-modelware.git"
    notify_committers = false
  }

  input {
    name              = "nabl"
    type              = "git"
    value             = "https://github.com/metaborg/nabl.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "rtg"
    type              = "git"
    value             = "https://github.com/metaborg/rtg.git"
    notify_committers = false
  }

  input {
    name              = "sdf"
    type              = "git"
    value             = "https://github.com/metaborg/sdf.git"
    notify_committers = false
  }

  input {
    name              = "shrike"
    type              = "svn"
    value             = "http://wala.svn.sourceforge.net/svnroot/wala/trunk/com.ibm.wala.shrike@3037"
    notify_committers = false
  }

  input {
    name              = "spoofax"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax.git typesmart"
    notify_committers = false
  }

  input {
    name              = "spoofaxdebug"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-debug.git"
    notify_committers = false
  }

  input {
    name              = "spoofaxdeploy"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-deploy.git typesmart"
    notify_committers = false
  }

  input {
    name              = "spt"
    type              = "git"
    value             = "https://github.com/metaborg/spt.git"
    notify_committers = false
  }

  input {
    name              = "stratego"
    type              = "git"
    value             = "https://github.com/metaborg/stratego.git"
    notify_committers = false
  }

  input {
    name              = "strategoxt"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "strategoxtCVersion"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git"
    notify_committers = false
  }

  input {
    name              = "strcj"
    type              = "sysbuild"
    value             = "strategoxt-java:strc-java-trunk:build"
    notify_committers = false
  }

  input {
    name              = "strj"
    type              = "sysbuild"
    value             = "strategoxt-java:strategoxt-java-bootstrap:bootstrap3"
    notify_committers = false
  }

  input {
    name              = "tdl"
    type              = "git"
    value             = "https://github.com/metaborg/tdl.git"
    notify_committers = false
  }

  input {
    name              = "ts"
    type              = "git"
    value             = "https://github.com/metaborg/ts.git"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "v.a.vergu@tudelft.nl, seba.github@gmail.com, xrj3dctbrf3a@bxc.io"
}

resource "hydra_jobset" "spoofax_spoofax-unstable" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "spoofax-unstable"
  type        = "legacy"
  description = "Spoofax [unstable]"

  nix_expression {
    file  = "jobs/spoofax-git/spoofax-master.nix"
    input = "hydraConfig"
  }

  input {
    name              = "aster"
    type              = "git"
    value             = "https://github.com/metaborg/aster.git unstable"
    notify_committers = false
  }

  input {
    name              = "box"
    type              = "git"
    value             = "https://github.com/metaborg/box.git unstable"
    notify_committers = false
  }

  input {
    name              = "esv"
    type              = "git"
    value             = "https://github.com/metaborg/esv.git unstable"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "imppatched"
    type              = "git"
    value             = "https://github.com/metaborg/imp-patched.git spoofax-unstable"
    notify_committers = false
  }

  input {
    name              = "javaFront"
    type              = "git"
    value             = "https://github.com/metaborg/java-front.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "jsglr"
    type              = "git"
    value             = "https://github.com/metaborg/jsglr.git unstable"
    notify_committers = false
  }

  input {
    name              = "lpgRuntime"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/sglr-recovery/trunk/lpg.runtime.java"
    notify_committers = false
  }

  input {
    name              = "mbexec"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec.git unstable"
    notify_committers = false
  }

  input {
    name              = "mbexecdeps"
    type              = "git"
    value             = "https://github.com/metaborg/mb-exec-deps.git unstable"
    notify_committers = false
  }

  input {
    name              = "mbrep"
    type              = "git"
    value             = "https://github.com/metaborg/mb-rep.git unstable"
    notify_committers = false
  }

  input {
    name              = "metaborgRuntime"
    type              = "git"
    value             = "https://github.com/metaborg/runtime-libraries.git unstable"
    notify_committers = false
  }

  input {
    name              = "modelware"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-modelware.git"
    notify_committers = false
  }

  input {
    name              = "nabl"
    type              = "git"
    value             = "https://github.com/metaborg/nabl.git unstable"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "rtg"
    type              = "git"
    value             = "https://github.com/metaborg/rtg.git unstable"
    notify_committers = false
  }

  input {
    name              = "sdf"
    type              = "git"
    value             = "https://github.com/metaborg/sdf.git unstable"
    notify_committers = false
  }

  input {
    name              = "shrike"
    type              = "svn"
    value             = "http://wala.svn.sourceforge.net/svnroot/wala/trunk/com.ibm.wala.shrike@3037"
    notify_committers = false
  }

  input {
    name              = "spoofax"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax.git unstable"
    notify_committers = false
  }

  input {
    name              = "spoofaxdebug"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-debug.git unstable"
    notify_committers = false
  }

  input {
    name              = "spoofaxdeploy"
    type              = "git"
    value             = "https://github.com/metaborg/spoofax-deploy.git unstable"
    notify_committers = false
  }

  input {
    name              = "spt"
    type              = "git"
    value             = "https://github.com/metaborg/spt.git unstable"
    notify_committers = false
  }

  input {
    name              = "stratego"
    type              = "git"
    value             = "https://github.com/metaborg/stratego.git unstable"
    notify_committers = false
  }

  input {
    name              = "strategoxt"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git java-bootstrap"
    notify_committers = false
  }

  input {
    name              = "strategoxtCVersion"
    type              = "git"
    value             = "https://github.com/metaborg/strategoxt.git"
    notify_committers = false
  }

  input {
    name              = "strcj"
    type              = "sysbuild"
    value             = "strategoxt-java:strc-java-trunk:build"
    notify_committers = false
  }

  input {
    name              = "strj"
    type              = "sysbuild"
    value             = "strategoxt-java:strategoxt-java-bootstrap:bootstrap3"
    notify_committers = false
  }

  input {
    name              = "tdl"
    type              = "git"
    value             = "https://github.com/metaborg/tdl.git unstable"
    notify_committers = false
  }

  input {
    name              = "ts"
    type              = "git"
    value             = "https://github.com/metaborg/ts.git unstable"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "spoofax_webworker" {
  project     = hydra_project.spoofax.name
  state       = "disabled"
  visible     = false
  name        = "webworker"
  type        = "legacy"
  description = "GWT webworker"

  nix_expression {
    file  = "jobs/webworker.nix"
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
    name              = "webWorker"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/webworker"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
