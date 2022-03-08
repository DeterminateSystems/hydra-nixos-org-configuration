resource "hydra_project" "nix" {
  name         = "nix"
  display_name = "Nix"
  homepage     = ""
  description  = "Nix, the purely functional package manager"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nix_PR-1643" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = true
  name        = "PR-1643"
  type        = "legacy"
  description = "Preserve file context across readFile, second take"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "git://github.com/abbradar/nix.git readfile 1"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-17.09"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_experimental" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = true
  name        = "experimental"
  type        = "legacy"
  description = "Experimental branch"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "https://github.com/edolstra/nix.git experimental"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.03-small"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_fast-eval" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = false
  name        = "fast-eval"
  type        = "legacy"
  description = "Fast evaluator branch"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/nix/branches/fast-eval"
    notify_committers = false
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
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "nix_flakes" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = false
  name        = "flakes"
  type        = "flake"
  description = "Flakes branch"

  flake_uri = "github:NixOS/nix/flakes"

  check_interval    = 600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_gc-branch" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = false
  name        = "gc-branch"
  type        = "legacy"
  description = "Garbage collector branch"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/nix/branches/gc"
    notify_committers = false
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
    name              = "system"
    type              = "string"
    value             = "i386-sunos"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "nix_mac-hang" {
  project     = hydra_project.nix.name
  state       = "enabled"
  visible     = true
  name        = "mac-hang"
  type        = "flake"
  description = "Default branch"

  flake_uri = "github:edolstra/nix/mac-hang"

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_maintenance-1_11" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = true
  name        = "maintenance-1.11"
  type        = "legacy"
  description = "Maintenance releases"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "https://github.com/NixOS/nix.git 1.11-maintenance 1"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-17.09"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "nix_maintenance-2_0" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = true
  name        = "maintenance-2.0"
  type        = "legacy"
  description = "2.0 release branch"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "https://github.com/NixOS/nix.git 2.0-maintenance"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.03"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_maintenance-2_1" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = true
  name        = "maintenance-2.1"
  type        = "legacy"
  description = "2.1 release branch"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "https://github.com/NixOS/nix.git 2.1-maintenance"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.03"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_maintenance-2_2" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = true
  name        = "maintenance-2.2"
  type        = "legacy"
  description = "2.2 release branch"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "https://github.com/NixOS/nix.git 2.2-maintenance"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09-small"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_maintenance-2_3" {
  project     = hydra_project.nix.name
  state       = "enabled"
  visible     = true
  name        = "maintenance-2.3"
  type        = "legacy"
  description = "2.3 release branch"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "https://github.com/NixOS/nix.git 2.3-maintenance"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git nixos-21.05-small"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_maintenance-2_4" {
  project     = hydra_project.nix.name
  state       = "enabled"
  visible     = true
  name        = "maintenance-2.4"
  type        = "flake"
  description = "2.4 release branch"

  flake_uri = "github:NixOS/nix/2.4-maintenance"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_maintenance-2_5" {
  project     = hydra_project.nix.name
  state       = "enabled"
  visible     = true
  name        = "maintenance-2.5"
  type        = "flake"
  description = "2.5 release branch"

  flake_uri = "github:NixOS/nix/2.5-maintenance"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_maintenance-2_6" {
  project     = hydra_project.nix.name
  state       = "enabled"
  visible     = true
  name        = "maintenance-2.6"
  type        = "flake"
  description = "2.6 release branch"

  flake_uri = "github:NixOS/nix/2.6-maintenance"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_maintenance-2_7" {
  project     = hydra_project.nix.name
  state       = "enabled"
  visible     = true
  name        = "maintenance-2.7"
  type        = "flake"
  description = "2.7 release branch"

  flake_uri = "github:NixOS/nix/2.7-maintenance"

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_markdown" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = false
  name        = "markdown"
  type        = "flake"
  description = "Markdown test"

  flake_uri = "github:edolstra/nix/markdown"

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_master" {
  project     = hydra_project.nix.name
  state       = "enabled"
  visible     = true
  name        = "master"
  type        = "flake"
  description = "Default branch"

  flake_uri = "github:NixOS/nix"

  check_interval    = 600
  scheduling_shares = 100
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_nixpkgs-master" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = false
  name        = "nixpkgs-master"
  type        = "legacy"
  description = "Master branch against nixpkgs master"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "https://github.com/NixOS/nix.git master 1"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git master"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_sqlite-branch" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = false
  name        = "sqlite-branch"
  type        = "legacy"
  description = "Nix with SQLite"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/nix/branches/sqlite"
    notify_committers = false
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
    name              = "system"
    type              = "string"
    value             = "i386-sunos"
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
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "nix_tmp-pr-2878" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = false
  name        = "tmp-pr-2878"
  type        = "legacy"
  description = "PR test"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "https://github.com/NixOS/nix.git run-in-pts"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09-small"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 100
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_tmp-pr-test" {
  project     = hydra_project.nix.name
  state       = "disabled"
  visible     = false
  name        = "tmp-pr-test"
  type        = "flake"
  description = "Flakes branch"

  flake_uri = "github:CSVdB/nix/nixIsTooPure"

  check_interval    = 0
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nix_tmp-rust" {
  project     = hydra_project.nix.name
  state       = "enabled"
  visible     = false
  name        = "tmp-rust"
  type        = "legacy"
  description = "Rust test"

  nix_expression {
    file  = "release.nix"
    input = "nix"
  }

  input {
    name              = "nix"
    type              = "git"
    value             = "https://github.com/edolstra/nix.git oxidize"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-19.09-small"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}
