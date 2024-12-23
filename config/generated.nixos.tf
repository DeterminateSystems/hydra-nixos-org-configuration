resource "hydra_project" "nixos" {
  name         = "nixos"
  display_name = "NixOS"
  homepage     = "http://nixos.org/nixos"
  description  = "NixOS, the purely functional Linux distribution"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nixos_bash-4_3" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "bash-4.3"
  type        = "legacy"
  description = "Bash 4.3 test"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git bash-4.3"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_binutils-2_26" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "binutils-2.26"
  type        = "legacy"
  description = "Binutils 2.26 test"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git binutils-2.26"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_binutils-2_34" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "binutils-2.34"
  type        = "legacy"
  description = "https://github.com/NixOS/nixpkgs/pull/89793"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/luc65r/nixpkgs.git staging"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 300
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_boot-order" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "boot-order"
  type        = "legacy"
  description = "Branch for boot order improvements"

  nix_expression {
    file  = "release.nix"
    input = "nixosSrc"
  }

  input {
    name              = "nixosSrc"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/nixos/branches/boot-order"
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
    name              = "services"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/services/trunk"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "x86_64-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "nixos_closure-size" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "closure-size"
  type        = "legacy"
  description = "Closure size reduction branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git closure-size"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_gcc-4_9" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "gcc-4.9"
  type        = "legacy"
  description = "GCC 4.9 test"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git gcc-4.9"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_gcc-5" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "gcc-5"
  type        = "legacy"
  description = "GCC 5 test"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git gcc-5"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_gcc-6" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "gcc-6"
  type        = "legacy"
  description = "GCC 6 test"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git gcc-6"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 1000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_gcc-7" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "gcc-7"
  type        = "legacy"
  description = "GCC 7 test"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git gcc-7"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 300
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_gcc-8" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "gcc-8"
  type        = "legacy"
  description = "GCC 8 test"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git gcc-8"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 600
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_glibc-2_18" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "glibc-2.18"
  type        = "legacy"
  description = "Glibc 2.18 branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git glibc-2.18"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_glibc-2_19" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "glibc-2.19"
  type        = "legacy"
  description = "Glibc 2.19 test"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git glibc-2.19"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 500
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_glibc-2_20" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "glibc-2.20"
  type        = "legacy"
  description = "Glibc 2.20 test"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git glibc-2.20"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_glibc-2_35" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "glibc-2.35"
  type        = "legacy"
  description = "Testing glibc 2.35: https://github.com/NixOS/nixpkgs/pull/165979"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/Ma27/nixpkgs.git glibc-2.35"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" /*\"aarch64-linux\"*/ ]"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_gnome-3_20" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "gnome-3.20"
  type        = "legacy"
  description = "Combined NixOS/Nixpkgs for gnome-3.20"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git gnome-3.20"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 28800
  scheduling_shares = 1024
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_grahamc-i686" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "grahamc-i686"
  type        = "legacy"
  description = "i686 limited support testing"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/grahamc/nixpkgs.git i686"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 7284
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_grsec-stdenv" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "grsec-stdenv"
  type        = "legacy"
  description = "Combined NixOS/Nixpkgs unstable"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git grsec-stdenv"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_issue-18312-webkitgtk24-removal" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "issue-18312-webkitgtk24-removal"
  type        = "legacy"
  description = "Get rid of webkitgtk24"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/domenkozar/nixpkgs.git webkitgtk24-removal"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 15000
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "nixos_kde47-test" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "kde47-test"
  type        = "legacy"
  description = "Trunk"

  nix_expression {
    file  = "release.nix"
    input = "nixosSrc"
  }

  input {
    name              = "nixosSrc"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/nixos/trunk"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git kde-4.7"
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
    name              = "system"
    type              = "string"
    value             = "x86_64-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "nixos_keymap-test-debug" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "keymap-test-debug"
  type        = "legacy"
  description = "keymap test debug"

  nix_expression {
    file  = "release.nix"
    input = "recipe"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/aszlig/nixpkgs.git keymap-test-debug"
    notify_committers = false
  }

  input {
    name              = "recipe"
    type              = "git"
    value             = "https://gist.github.com/3bf82d4d5c20d682e3c2e610cf526a65.git"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 7284
  keep_evaluations  = 2

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_mariadb-10_2" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "mariadb-10.2"
  type        = "legacy"
  description = "mariadb 10.2 test"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git mariadb-10.2"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 10000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_master" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "master"
  type        = "legacy"
  description = "NixOS unstable (master) branch"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 10800
  scheduling_shares = 1000
  keep_evaluations  = 1

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "nixos_modular" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "modular"
  type        = "legacy"
  description = "Modular NixOS branch"

  nix_expression {
    file  = "release.nix"
    input = "nixosSrc"
  }

  input {
    name              = "nixosSrc"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/nixos/branches/modular-nixos"
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

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "nixos_nix-2_0" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "nix-2.0"
  type        = "legacy"
  description = "Nix 2.0 test"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git nix-2.0"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 28800
  scheduling_shares = 10000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_nix-2_24-upgrade" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "nix-2.24-upgrade"
  type        = "legacy"
  description = "Testing PR #335342: nix: 2.18 -> 2.24"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git nix-2.24-upgrade"
    notify_committers = false
  }

  check_interval    = 36000
  scheduling_shares = 1
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_nixos-test-expensive-eval" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "nixos-test-expensive-eval"
  type        = "legacy"
  description = "Testing cheaper NixOS test evaluation"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/vcunat/nixpkgs.git p/nixos-test-expensive-eval"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_nixup" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "nixup"
  type        = "legacy"
  description = "Combined NixOS/Nixpkgs for https://github.com/NixOS/nixpkgs/pull/9250"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git refs/pull/9250/head"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 284
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_openssl-1_1" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "openssl-1.1"
  type        = "legacy"
  description = "openssl 1.1 test"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git openssl-1.1"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 186400
  scheduling_shares = 20
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_patchelf-0_10" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "patchelf-0.10"
  type        = "legacy"
  description = "Testing #69213"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "limitedSupportedSystems"
    type              = "nix"
    value             = "[]"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/vcunat/nixpkgs.git p/patchelf-0.10"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

