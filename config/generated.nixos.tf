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

resource "hydra_jobset" "nixos_patchelf-0_9" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "patchelf-0.9"
  type        = "legacy"
  description = "PatchELF 0.9 test"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git patchelf-0.9"
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

resource "hydra_jobset" "nixos_perl-5_20" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "perl-5.20"
  type        = "legacy"
  description = "Perl 5.20 test"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git perl-5.20"
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

resource "hydra_jobset" "nixos_perl-5_22" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "perl-5.22"
  type        = "legacy"
  description = "Perl 5.22 test"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git perl-5.22"
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

resource "hydra_jobset" "nixos_pr-154911-cryptsetup-unstable-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "pr-154911-cryptsetup-unstable-small"
  type        = "legacy"
  description = "PR#154911 with a cryptsetup fix to get the build farm working."

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/mweinelt/nixpkgs.git cryptsetup"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 20000000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_pr-181764-libxcrypt" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "pr-181764-libxcrypt"
  type        = "legacy"
  description = "PR: glibc: make crypt support optional"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/mweinelt/nixpkgs.git glibc-without-libcrypt"
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
  scheduling_shares = 2
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_pr-193600-aarch64-support" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "pr-193600-aarch64-support"
  type        = "legacy"
  description = "Testing PR #193600: nixos/release: Make aarch64-linux a supported system again"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/mweinelt/nixpkgs.git release-small-aarch64"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 36000
  scheduling_shares = 1
  keep_evaluations  = 2

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_pr-208706-go-1_20" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "pr-208706-go-1.20"
  type        = "legacy"
  description = "Testing PR #208706: go: default to 1.20"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/qowoz/nixpkgs.git go119120"
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

  check_interval    = 86400
  scheduling_shares = 2
  keep_evaluations  = 2

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_pr-209870-gcc-external-bootstrap" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "pr-209870-gcc-external-bootstrap"
  type        = "legacy"
  description = "Testing #209870: stdenv: external gcc bootstrap"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/amjoseph-nixpkgs/nixpkgs.git pr/stdenv/external-gcc-bootstrap"
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
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_pr-244907-bootloaders-init" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "pr-244907-bootloaders-init"
  type        = "legacy"
  description = "Testing PR #244907: nixos/system/boot/bootloaders: init"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs.git pr-jobset-244907"
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

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 2

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_pr-258680-systemd_network-online_target" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "pr-258680-systemd_network-online.target"
  type        = "legacy"
  description = "Testing PR #258680: nixos/systemd: don't require network-online.target for multi-user.target"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/lf-/nixpkgs.git jade/remove-multiuser-netonline-dep"
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

  check_interval    = 172800
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_python-test-refactoring" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "python-test-refactoring"
  type        = "legacy"
  description = "Staging branch for changes to the NixOS test driver"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs.git python-test-refactoring"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 10
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-13_10" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-13.10"
  type        = "legacy"
  description = "NixOS 13.10 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-13.10"
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
    value             = "true"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1000
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-14_04" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-14.04"
  type        = "legacy"
  description = "NixOS 14.04 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.04"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 15000
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-14_04-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-14.04-small"
  type        = "legacy"
  description = "NixOS 14.04 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.04"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 1800
  scheduling_shares = 1000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-14_12" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-14.12"
  type        = "legacy"
  description = "NixOS 14.12 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-14_12-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-14.12-small"
  type        = "legacy"
  description = "NixOS 14.12 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-14.12"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-15_09" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-15.09"
  type        = "legacy"
  description = "NixOS 15.09 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-15.09"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 300
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-15_09-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-15.09-small"
  type        = "legacy"
  description = "NixOS 15.09 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-15.09"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 20000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-16_03" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-16.03"
  type        = "legacy"
  description = "NixOS 16.03 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-16.03"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 500
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-16_03-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-16.03-small"
  type        = "legacy"
  description = "NixOS 16.03 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-16.03"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 20000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-16_09" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-16.09"
  type        = "legacy"
  description = "NixOS 16.09 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-16.09"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 150000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-16_09-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-16.09-small"
  type        = "legacy"
  description = "NixOS 16.09 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-16.09"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 2000000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-17_03" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-17.03"
  type        = "legacy"
  description = "NixOS 17.03 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-17.03"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 28800
  scheduling_shares = 300
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-17_03-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-17.03-small"
  type        = "legacy"
  description = "NixOS 17.03 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-17.03"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 2000000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-17_09" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-17.09"
  type        = "legacy"
  description = "NixOS 17.09 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-17.09"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 28800
  scheduling_shares = 150000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-17_09-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-17.09-small"
  type        = "legacy"
  description = "NixOS 17.09 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-17.09"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-18_03" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-18.03"
  type        = "legacy"
  description = "NixOS 18.03 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-18.03"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 21600
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-18_03-aarch64" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-18.03-aarch64"
  type        = "legacy"
  description = "NixOS 18.03 release branch: aarch64"

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
    value             = "https://github.com/NixOS/nixpkgs.git release-18.03"
    notify_committers = true
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
    value             = "[ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-18_03-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-18.03-small"
  type        = "legacy"
  description = "NixOS 18.03 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-18.03"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-18_09" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-18.09"
  type        = "legacy"
  description = "NixOS 18.09 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-18.09"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-18_09-aarch64" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-18.09-aarch64"
  type        = "legacy"
  description = "NixOS 18.09 release branch: aarch64"

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
    value             = "https://github.com/NixOS/nixpkgs.git release-18.09"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-18_09-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-18.09-small"
  type        = "legacy"
  description = "NixOS 18.09 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-18.09"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-19_03" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-19.03"
  type        = "legacy"
  description = "NixOS 19.03 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-19.03"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-19_03-aarch64" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-19.03-aarch64"
  type        = "legacy"
  description = "NixOS 19.03 release branch: aarch64"

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
    value             = "https://github.com/NixOS/nixpkgs.git release-19.03"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-19_03-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-19.03-small"
  type        = "legacy"
  description = "NixOS 19.03 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-19.03"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-19_09" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-19.09"
  type        = "legacy"
  description = "NixOS 19.09 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-19.09"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-19_09-aarch64" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-19.09-aarch64"
  type        = "legacy"
  description = "NixOS 19.09 release branch: aarch64"

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
    value             = "https://github.com/NixOS/nixpkgs.git release-19.09"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 28800
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-19_09-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-19.09-small"
  type        = "legacy"
  description = "NixOS 19.09 small release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-19.09"
    notify_committers = true
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 21600
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-20_03" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-20.03"
  type        = "legacy"
  description = "NixOS 20.03 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-20.03"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 1
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-20_03-aarch64" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-20.03-aarch64"
  type        = "legacy"
  description = "NixOS 20.03 release branch"

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
    value             = "https://github.com/NixOS/nixpkgs.git release-20.03"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-20_03-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-20.03-small"
  type        = "legacy"
  description = "NixOS 20.03 release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-20.03"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 1
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-20_09" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-20.09"
  type        = "legacy"
  description = "NixOS 20.09 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-20.09"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 5000000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-20_09-aarch64" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-20.09-aarch64"
  type        = "legacy"
  description = "NixOS 20.09 release branch"

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
    value             = "https://github.com/NixOS/nixpkgs.git release-20.09"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 150000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-20_09-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-20.09-small"
  type        = "legacy"
  description = "NixOS 20.09 release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-20.09"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 20000000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-21_05" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-21.05"
  type        = "legacy"
  description = "NixOS 21.05 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-21.05"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 500
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-21_05-aarch64" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-21.05-aarch64"
  type        = "legacy"
  description = "NixOS 21.05 release branch"

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
    value             = "https://github.com/NixOS/nixpkgs.git release-21.05"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 150000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-21_05-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-21.05-small"
  type        = "legacy"
  description = "NixOS 21.05 release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-21.05"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 2000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-21_11" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-21.11"
  type        = "legacy"
  description = "NixOS 21.11 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-21.11"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 5
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-21_11-aarch64" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-21.11-aarch64"
  type        = "legacy"
  description = "NixOS 21.11 release branch"

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
    value             = "https://github.com/NixOS/nixpkgs.git release-21.11"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 2
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-21_11-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-21.11-small"
  type        = "legacy"
  description = "NixOS 21.11 release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-21.11"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 20
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-22_05" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-22.05"
  type        = "legacy"
  description = "NixOS 22.05 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-22.05"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 50
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-22_05-aarch64" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-22.05-aarch64"
  type        = "legacy"
  description = "NixOS 22.05 release branch"

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
    value             = "https://github.com/NixOS/nixpkgs.git release-22.05"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 150
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-22_05-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-22.05-small"
  type        = "legacy"
  description = "NixOS 22.05 release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-22.05"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-22_11" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-22.11"
  type        = "legacy"
  description = "NixOS 22.11 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-22.11"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 129600
  scheduling_shares = 50000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-22_11-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-22.11-small"
  type        = "legacy"
  description = "NixOS 22.11 release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-22.11"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 20000000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-23_05" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-23.05"
  type        = "legacy"
  description = "NixOS 23.05 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-23.05"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 345600
  scheduling_shares = 50
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-23_05-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "release-23.05-small"
  type        = "legacy"
  description = "NixOS 23.05 release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-23.05"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 2000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-23_11" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-23.11"
  type        = "legacy"
  description = "NixOS 23.11 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-23.11"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 1
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-23_11-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "release-23.11-small"
  type        = "legacy"
  description = "NixOS 23.11 release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-23.11"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-24_05" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "release-24.05"
  type        = "legacy"
  description = "NixOS 24.05 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-24.05"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = -216000
  scheduling_shares = 5000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-24_05-small" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "release-24.05-small"
  type        = "legacy"
  description = "NixOS 24.05 release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-24.05"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 2000000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-24_11" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "release-24.11"
  type        = "legacy"
  description = "NixOS 24.11 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-24.11"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 129600
  scheduling_shares = 5000000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_release-24_11-small" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "release-24.11-small"
  type        = "legacy"
  description = "NixOS 24.11 release branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-24.11"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 20000000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_releasexx-23_05" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "releasexx-23.05"
  type        = "legacy"
  description = "NixOS 23.05 release branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-23.05"
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
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 5000000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_reproducibility" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "reproducibility"
  type        = "legacy"
  description = "Reproducibility test"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git reproducibility"
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
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_rhel6" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "rhel6"
  type        = "legacy"
  description = "RHEL 6 test"

  nix_expression {
    file  = "release.nix"
    input = "recipe"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/vcunat/nixpkgs.git p/rhel6"
    notify_committers = false
  }

  input {
    name              = "recipe"
    type              = "git"
    value             = "https://gist.github.com/vcunat/430a577d571369c1bd186974b7d7dc6c.git"
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
  keep_evaluations  = 2

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_staging" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "staging"
  type        = "legacy"
  description = "Staging branch"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_staging-17_03" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "staging-17.03"
  type        = "legacy"
  description = "NixOS 17.03 staging"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-17.03"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1500
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_staging-next-22_11-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "staging-next-22.11-small"
  type        = "legacy"
  description = "staging{,-next}-22.11 branch, manually depending on situation"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-next-22.11"
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
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 10
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_staging-next-23_05-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "staging-next-23.05-small"
  type        = "legacy"
  description = "staging-next-23.05 branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-next-23.05"
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
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_staging-next-23_11-small" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "staging-next-23.11-small"
  type        = "legacy"
  description = "staging-next-23.11 branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-next-23.11"
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
    value             = "[ /*\"x86_64-linux\"*/ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_staging-next-24_05-small" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "staging-next-24.05-small"
  type        = "legacy"
  description = "staging-next-24.05 branch, small jobset"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-next-24.05"
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
    value             = "[ /*\"x86_64-linux\"*/ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_staging-next-24_11-small" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "staging-next-24.11-small"
  type        = "legacy"
  description = "staging-next-24.11 branch, small jobset"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-next-24.11"
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
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_staging-next-small" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "staging-next-small"
  type        = "legacy"
  description = "staging-next branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs.git staging-next"
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
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_staging-small" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "staging-small"
  type        = "legacy"
  description = "staging branch"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs.git staging"
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
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_stdenv-test" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "stdenv-test"
  type        = "legacy"
  description = "NixOS trunk using the stdenv-updates branch from Nixpkgs"

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
    value             = "https://github.com/NixOS/nixpkgs.git stdenv-updates"
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
    value             = "i686-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "nixos_stdenv-updates" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "stdenv-updates"
  type        = "legacy"
  description = "Stdenv branch of both nixpkgs and nixos"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git stdenv-updates"
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
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = false
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "nixos_systemd" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "systemd"
  type        = "legacy"
  description = "Systemd branch"

  nix_expression {
    file  = "release.nix"
    input = "nixosSrc"
  }

  input {
    name              = "nixosSrc"
    type              = "git"
    value             = "https://github.com/NixOS/nixos.git systemd"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git systemd"
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
    value             = "i686-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "nixos_systemd-217" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "systemd-217"
  type        = "legacy"
  description = "Systemd 217 test"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git systemd-217"
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

resource "hydra_jobset" "nixos_systemd-227" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "systemd-227"
  type        = "legacy"
  description = "Systemd 227 test"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git systemd-219"
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

resource "hydra_jobset" "nixos_systemd-249" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "systemd-249"
  type        = "legacy"
  description = "Systemd 249"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/andir/nixpkgs.git systemdv249"
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

resource "hydra_jobset" "nixos_systemd-250" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "systemd-250"
  type        = "legacy"
  description = "Systemd 250"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/andir/nixpkgs.git systemd-250"
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

resource "hydra_jobset" "nixos_systemd-update" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "systemd-update"
  type        = "legacy"
  description = "Systemd 212 test"

  nix_expression {
    file  = "nixos/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git systemd-update"
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
  scheduling_shares = 1000
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "nixos_trunk-combined" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "trunk-combined"
  type        = "legacy"
  description = "Combined NixOS/Nixpkgs unstable"

  nix_expression {
    file  = "nixos/release-combined.nix"
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

  check_interval    = 129600
  scheduling_shares = 768
  keep_evaluations  = 2

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_trunk-combined-test-eval" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "trunk-combined-test-eval"
  type        = "legacy"
  description = "Testing eval regression in: Combined NixOS/Nixpkgs unstable"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git master-test-eval"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 7284
  keep_evaluations  = 2

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_unstable-aarch64" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "unstable-aarch64"
  type        = "legacy"
  description = "Testing the addition of aarch64 to the Tested jobset"

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
    value             = "https://github.com/NixOS/nixpkgs.git unstable-aarch64"
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
    value             = "[\"aarch64-linux\"]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 7284
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_unstable-small" {
  project     = hydra_project.nixos.name
  state       = "enabled"
  visible     = true
  name        = "unstable-small"
  type        = "legacy"
  description = "NixOS small unstable channel"

  nix_expression {
    file  = "nixos/release-small.nix"
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

  check_interval    = 43200
  scheduling_shares = 200000
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_unstable-small-CVE-2018-15688" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = true
  name        = "unstable-small-CVE-2018-15688"
  type        = "legacy"
  description = "NixOS small unstable with systemd CVE-2018-15688 fix"

  nix_expression {
    file  = "nixos/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git package/systemd-v239.20181031"
    notify_committers = false
  }

  input {
    name              = "stableBranch"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 200000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixos_xorg-test" {
  project     = hydra_project.nixos.name
  state       = "disabled"
  visible     = false
  name        = "xorg-test"
  type        = "legacy"
  description = "Integration test of the Nixpkgs x-updates branch"

  nix_expression {
    file  = "release.nix"
    input = "nixosSrc"
  }

  input {
    name              = "nixosSrc"
    type              = "git"
    value             = "https://github.com/NixOS/nixos.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git x-updates"
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
    value             = "i686-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}
