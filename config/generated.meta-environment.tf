resource "hydra_project" "meta-environment" {
  name         = "meta-environment"
  display_name = "Meta Environment"
  homepage     = "http://www.meta-environment.org"
  description  = "Meta Environment"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "meta-environment_aterm-trunk" {
  project     = hydra_project.meta-environment.name
  state       = "disabled"
  visible     = false
  name        = "aterm-trunk"
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

resource "hydra_jobset" "meta-environment_c-library-trunk" {
  project     = hydra_project.meta-environment.name
  state       = "disabled"
  visible     = true
  name        = "c-library-trunk"
  type        = "legacy"
  description = "C Library"

  nix_expression {
    file  = "jobs/c-library.nix"
    input = "hydraConfig"
  }

  input {
    name              = "aterm"
    type              = "build"
    value             = "aterm-trunk:build [system=\"i686-linux\"]"
    notify_committers = false
  }

  input {
    name              = "cLibraryCheckout"
    type              = "svn"
    value             = "svn+ssh://svn.cwi.nl/c-library/trunk"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "metaBuildEnv"
    type              = "build"
    value             = "meta-build-env-trunk:build [system=\"i686-linux\"]"
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

resource "hydra_jobset" "meta-environment_error-support-trunk" {
  project     = hydra_project.meta-environment.name
  state       = "disabled"
  visible     = false
  name        = "error-support-trunk"
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

resource "hydra_jobset" "meta-environment_meta-build-env-trunk" {
  project     = hydra_project.meta-environment.name
  state       = "disabled"
  visible     = true
  name        = "meta-build-env-trunk"
  type        = "legacy"
  description = "Meta Build Env"

  nix_expression {
    file  = "jobs/meta-build-env.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "metaBuildEnvTrunk"
    type              = "svn"
    value             = "svn+ssh://svn.cwi.nl/meta-build-env/trunk"
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

resource "hydra_jobset" "meta-environment_sdf-library-trunk" {
  project     = hydra_project.meta-environment.name
  state       = "disabled"
  visible     = true
  name        = "sdf-library-trunk"
  type        = "legacy"
  description = "SDF Library"

  nix_expression {
    file  = "jobs/sdf-library.nix"
    input = "hydraConfig"
  }

  input {
    name              = "aterm"
    type              = "build"
    value             = "aterm-trunk:build [system=\"i686-linux\"]"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://svn.strategoxt.org/repos/StrategoXT/hydra"
    notify_committers = false
  }

  input {
    name              = "metaBuildEnv"
    type              = "build"
    value             = "meta-build-env-trunk:build [system=\"i686-linux\"]"
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
    name              = "sdfLibraryCheckout"
    type              = "svn"
    value             = "svn+ssh://svn.cwi.nl/sdf-library/trunk"
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

resource "hydra_jobset" "meta-environment_toolbuslib-trunk" {
  project     = hydra_project.meta-environment.name
  state       = "disabled"
  visible     = false
  name        = "toolbuslib-trunk"
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
