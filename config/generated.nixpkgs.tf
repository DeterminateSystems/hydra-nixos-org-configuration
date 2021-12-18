resource "hydra_project" "nixpkgs" {
  name         = "nixpkgs"
  display_name = "Nixpkgs"
  homepage     = "http://nixos.org/nixpkgs"
  description  = "Nix Packages collection"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "nixpkgs_aarch64-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "aarch64-darwin"
  type        = "legacy"
  description = "testing aarch64-darwin: PR #105026"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "limitedSupportedSystems"
    type              = "nix"
    value             = "[ ]"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/thefloweringash/nixpkgs.git apple-silicon"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 3000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_autoconf-2_70" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "autoconf-2.70"
  type        = "legacy"
  description = "Testing autoconf update"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/alyssais/nixpkgs.git autoconf"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_autoconf-2_71" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "autoconf-2.71"
  type        = "legacy"
  description = "Testing autoconf update: PR #111431"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/andir/nixpkgs.git autoconf271"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_bash-5" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "bash-5"
  type        = "legacy"
  description = "PR #136677: testing bash upgrade"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/happysalada/nixpkgs.git testing_bash_upgrade"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_bash-no-undef-vars" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "bash-no-undef-vars"
  type        = "legacy"
  description = "set -u everywhere"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git bash-no-undef-vars"
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

  check_interval    = 0
  scheduling_shares = 600
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_binutils-2-30" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "binutils-2-30"
  type        = "legacy"
  description = "binutils-2.30 branch"

  nix_expression {
    file  = "pkgs/top-level/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git binutils-2.30"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_binutils-2_36" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = false
  name        = "binutils-2.36"
  type        = "legacy"
  description = "See PR #134917: binutils: 2.35.1 -> 2.37"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs.git binutils-2.37"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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
  scheduling_shares = 60
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_closure-size" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "closure-size"
  type        = "legacy"
  description = "Closure size reduction branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
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
  scheduling_shares = 600
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_copumpkin-wip" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "copumpkin-wip"
  type        = "legacy"
  description = "Copumpkin darwin playground"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/copumpkin/nixpkgs.git copumpkin-wip"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 600
  scheduling_shares = 1
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_cpan-update" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "cpan-update"
  type        = "legacy"
  description = "cpan-update"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs cpan-update"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_cross-staging" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "cross-staging"
  type        = "legacy"
  description = "staging branch cross builds"

  nix_expression {
    file  = "pkgs/top-level/release-cross.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "x86_64-linux"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_cross-stdenv" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "cross-stdenv"
  type        = "legacy"
  description = "Nixpkgs Stdenv Cross builds"

  nix_expression {
    file  = "pkgs/top-level/release-cross.nix"
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
    name              = "system"
    type              = "string"
    value             = "x86_64-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_cross-trunk" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "cross-trunk"
  type        = "legacy"
  description = "master branch cross builds"

  nix_expression {
    file  = "pkgs/top-level/release-cross.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_cve-2010-3856" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "cve-2010-3856"
  type        = "legacy"
  description = "Various Glibc security fixes"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git cve-2010-3856"
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

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_darwin-next" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "darwin-next"
  type        = "legacy"
  description = "Testing ground for forthcoming darwin changes"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git darwin-next"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 600
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_darwin-updates" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "darwin-updates"
  type        = "legacy"
  description = "Updates of Darwin's stdenv"

  nix_expression {
    file  = "pkgs/top-level/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git darwin-updates"
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

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "ludo@gnu.org"
}

resource "hydra_jobset" "nixpkgs_ericson2314-cross-staging" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "ericson2314-cross-staging"
  type        = "legacy"
  description = "Testing my latest cross compilation PR with release-cross.nix"

  nix_expression {
    file  = "pkgs/top-level/release-cross.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/taktoa/nixpkgs.git mingw-upgrade"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "x86_64-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_ericson2314-haskell-updates" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "ericson2314-haskell-updates"
  type        = "legacy"
  description = "Testing ground for Haskell packages in Nix"

  nix_expression {
    file  = "haskell-nixpkgs.nix"
    input = "ciSrc"
  }

  input {
    name              = "ciSrc"
    type              = "git"
    value             = "https://github.com/peti/ci"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/obsidiansystems/nixpkgs haskell-strictDeps"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_ericson2314-old-cross-known-good" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "ericson2314-old-cross-known-good"
  type        = "legacy"
  description = "Testing changes on and old nixpkgs, making sure to avoid regressions"

  nix_expression {
    file  = "pkgs/top-level/release-cross.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/obsidiansystems/nixpkgs.git ericson2314-old-cross-known-good"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "x86_64-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_ericson2314-staging" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "ericson2314-staging"
  type        = "legacy"
  description = "Testing my latest large rebuild with release.nix"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/obsidiansystems/nixpkgs.git compiler-rt-master"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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

resource "hydra_jobset" "nixpkgs_gcc-5" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "gcc-5"
  type        = "legacy"
  description = "Switch to gcc 5"

  nix_expression {
    file  = "pkgs/top-level/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/shlevy/nixpkgs.git gcc-5"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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

  check_interval    = 300
  scheduling_shares = 1500
  keep_evaluations  = 1

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_gcc-9" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "gcc-9"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git gcc-9"
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
  scheduling_shares = 6000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_gcc8" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "gcc8"
  type        = "legacy"
  description = ""

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

  check_interval    = 0
  scheduling_shares = 600
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_glib-230" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "glib-230"
  type        = "legacy"
  description = "glib 2.30 branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git glib-2.30-take2"
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

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_glibc-2-27" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "glibc-2-27"
  type        = "legacy"
  description = "glibc-2.27 branch"

  nix_expression {
    file  = "pkgs/top-level/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git glibc-2.27"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 500000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_glibc-2_34" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "glibc-2.34"
  type        = "legacy"
  description = "https://github.com/NixOS/nixpkgs/pull/133431"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/Ma27/nixpkgs.git glibc-2.34"
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

resource "hydra_jobset" "nixpkgs_glibc-230" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "glibc-230"
  type        = "legacy"
  description = "glibc 2.30 bump, PR #66528"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/lblasc/nixpkgs.git glibc230"
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
  scheduling_shares = 3000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_glibc-231" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "glibc-231"
  type        = "legacy"
  description = "glibc 2.31 bump"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git glibc231"
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

  check_interval    = 0
  scheduling_shares = 300
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_glibc-232" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "glibc-232"
  type        = "legacy"
  description = "glibc 2.32 bump"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git glibc232"
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
  scheduling_shares = 300
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_gnome" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "gnome"
  type        = "legacy"
  description = "gnome-related updates"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git gnome-41"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\"  /*\"x86_64-darwin\"*/ ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 60
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_gnome-stable" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "gnome-stable"
  type        = "legacy"
  description = "gnome-related updates"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git gnome-20.03"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\"  \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 200000
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_graham-i686" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "graham-i686"
  type        = "legacy"
  description = "i686 limited support testing"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/grahamc/nixpkgs.git i686"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 1500
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_gtk-doc" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "gtk-doc"
  type        = "legacy"
  description = "https://github.com/NixOS/nixpkgs/pull/62634"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/worldofpeace/nixpkgs.git gtk-doc"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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

  check_interval    = 14400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_guile2test" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "guile2test"
  type        = "legacy"
  description = "Testing packages against Guile 2"

  nix_expression {
    file  = "pkgs/top-level/guile-2-test.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git"
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

resource "hydra_jobset" "nixpkgs_hardening-flags" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "hardening-flags"
  type        = "legacy"
  description = "See PR #104091: more security hardening flags"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "limitedSupportedSystems"
    type              = "nix"
    value             = "[ \"i686-linux\" ]"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/TredwellGit/nixpkgs.git PIE"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_haskell-updates" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "haskell-updates"
  type        = "legacy"
  description = "Testing ground for Haskell packages in Nix"

  nix_expression {
    file  = "pkgs/top-level/release-haskell.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs haskell-updates"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 50000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_kde47" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "kde47"
  type        = "legacy"
  description = "KDE 4.7 branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
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
    name              = "system"
    type              = "string"
    value             = "i686-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_libGL-headers" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "libGL-headers"
  type        = "legacy"
  description = "See PR #118479: libGL: use headers from glvnd"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/gebner/nixpkgs.git glvndheaders"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_libpng15" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "libpng15"
  type        = "legacy"
  description = "Libpng 1.5 testing branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git libpng15"
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

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_linux-llvm-bump" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "linux-llvm-bump"
  type        = "legacy"
  description = "Testing LLVM bump: PR #142593"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/toonn/nixpkgs.git linux-llvm-bump"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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
  scheduling_shares = 10
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_lnl7-wip" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = false
  name        = "lnl7-wip"
  type        = "legacy"
  description = "LnL darwin playground"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/LnL7/nixpkgs.git lnl7-wip"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_modular-python" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "modular-python"
  type        = "legacy"
  description = "Trunk"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git modular-python"
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

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_multiple-outputs" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "multiple-outputs"
  type        = "legacy"
  description = "Multiple outputs branch"

  nix_expression {
    file  = "pkgs/top-level/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git multiple-outputs"
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

resource "hydra_jobset" "nixpkgs_nixpkgs-17_09-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "nixpkgs-17.09-darwin"
  type        = "legacy"
  description = "Stable Darwin channel corresponding to NixOS release"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
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

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 50
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-18_03-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "nixpkgs-18.03-darwin"
  type        = "legacy"
  description = "Stable Darwin channel corresponding to NixOS release"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-18.03"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-18_09-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "nixpkgs-18.09-darwin"
  type        = "legacy"
  description = "Stable Darwin channel corresponding to NixOS release"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-18.09"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-19_03-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "nixpkgs-19.03-darwin"
  type        = "legacy"
  description = "Stable Darwin channel corresponding to NixOS release"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-19.03"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 7200
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-19_09-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "nixpkgs-19.09-darwin"
  type        = "legacy"
  description = "Stable Darwin channel corresponding to NixOS release"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-19.09"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-20_03-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "nixpkgs-20.03-darwin"
  type        = "legacy"
  description = "Darwin builds for the NixOS 20.03 release."

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-20.03"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 28800
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-20_09-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "nixpkgs-20.09-darwin"
  type        = "legacy"
  description = "Darwin builds for the NixOS 20.09 release."

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-20.09"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 5000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-21_05-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "nixpkgs-21.05-darwin"
  type        = "legacy"
  description = "Darwin builds for the NixOS 21.05 release."

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-21.05"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" \"aarch64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 5000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-21_11-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "nixpkgs-21.11-darwin"
  type        = "legacy"
  description = "Darwin builds for the NixOS 21.11 release."

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-21.11"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" \"aarch64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 5000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-unstable-aarch64-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "nixpkgs-unstable-aarch64-darwin"
  type        = "legacy"
  description = "Building the 'master' branch for aarch64-darwin."

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
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
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"aarch64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 3000
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-unstable-armv7l" {
  project     = hydra_project.nixpkgs.name
  state       = "one-at-a-time"
  visible     = true
  name        = "nixpkgs-unstable-armv7l"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = "pkgs/top-level/release.nix"
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
    value             = "https://github.com/NixOS/nixpkgs.git master"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"armv7l-linux\" ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 100000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_openssl-1_1" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
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

  check_interval    = 0
  scheduling_shares = 2342
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_openssl-1_1_x-update" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "openssl-1.1.x-update"
  type        = "legacy"
  description = "openssl update to version 1.1.x"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "git://github.com/peti/nixpkgs.git openssl-1.1.x-update"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 21600
  scheduling_shares = 50000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_parallel-building-merger" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "parallel-building-merger"
  type        = "legacy"
  description = "Trunk"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git parallel-building-merger"
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

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_perl-5_20" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "perl-5.20"
  type        = "legacy"
  description = "Perl 5.20 test"

  nix_expression {
    file  = "pkgs/top-level/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git perl-5.20"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 600
  keep_evaluations  = 0

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-10399" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-10399"
  type        = "legacy"
  description = "OpenStack"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/domenkozar/nixpkgs.git openstack-nova-liberty"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 600
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-12701" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-12701"
  type        = "legacy"
  description = "builderDefsPackage cleanup"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/mayflower/nixpkgs.git builder-def-cleanup"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 600
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-132490" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "pr-132490"
  type        = "legacy"
  description = "Testing cleanups in stdenv shell code"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/happysalada/nixpkgs.git stdenv_setup_test"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-139514" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-139514"
  type        = "legacy"
  description = "PR #139514: testing some stdenv-wide changes"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/happysalada/nixpkgs.git testing_proposal"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ /*\"x86_64-linux\" \"x86_64-darwin\" \"aarch64-darwin\"*/ \"aarch64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 20
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-142860-stdenv-failglob" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "pr-142860-stdenv-failglob"
  type        = "legacy"
  description = "Testing failglob in stdenv: PR #142860"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/happysalada/nixpkgs.git failglob"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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

  check_interval    = 172800
  scheduling_shares = 10
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-146685" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "pr-146685"
  type        = "legacy"
  description = "ncurses: 6.2 -> 6.3"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/trofi/nixpkgs.git update-ncurses"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\"  /*\"aarch64-linux\" \"x86_64-darwin\"*/ ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-1515" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-1515"
  type        = "legacy"
  description = "#1515"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git test-1515"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 20
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-1633" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-1633"
  type        = "legacy"
  description = "Trunk"

  nix_expression {
    file  = "pkgs/top-level/release-small.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/wavewave/nixpkgs.git ncurses"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 20
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-19990" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-19990"
  type        = "legacy"
  description = "build all packages on at least 64bit linux"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/domenkozar/nixpkgs.git buildtheworld"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 100
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-2131" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-2131"
  type        = "legacy"
  description = "#2131"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/alexanderkjeldaas/nixpkgs.git make-glibc-pure"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 20
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-26799" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-26799"
  type        = "legacy"
  description = "haskell infra: Fix cross compilation to work with new system"

  nix_expression {
    file  = "haskell-nixpkgs.nix"
    input = "ciSrc"
  }

  input {
    name              = "ciSrc"
    type              = "git"
    value             = "git://github.com/peti/ci.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "git://github.com/obsidiansystems/nixpkgs.git cross-haskell"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 100000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-27209" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-27209"
  type        = "legacy"
  description = "https://github.com/NixOS/nixpkgs/pull/27209"

  nix_expression {
    file  = "haskell-nixpkgs.nix"
    input = "ciSrc"
  }

  input {
    name              = "ciSrc"
    type              = "git"
    value             = "git://github.com/peti/ci.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "git://github.com/nc6/nixpkgs.git nc/haskell-multiple-out"
    notify_committers = false
  }

  check_interval    = 186400
  scheduling_shares = 50000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-32112" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "pr-32112"
  type        = "legacy"
  description = "Revive multiple outputs for Haskell packages."

  nix_expression {
    file  = "haskell-nixpkgs.nix"
    input = "ciSrc"
  }

  input {
    name              = "ciSrc"
    type              = "git"
    value             = "git://github.com/peti/ci.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "git://github.com/nc6/nixpkgs.git hask-split-out"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 50000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-32629" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-32629"
  type        = "legacy"
  description = "master branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git haskell-outputs-bin-etc-lib"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 100
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-4085" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-4085"
  type        = "legacy"
  description = "Boost Library re-factoring"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/wkennington/nixpkgs.git master.boost"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 250
  keep_evaluations  = 0

  email_notifications = false
  email_override      = "simons@cryp.to"
}

resource "hydra_jobset" "nixpkgs_pr-4857" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-4857"
  type        = "legacy"
  description = "Improve printing experience and update related packages"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/abbradar/nixpkgs.git cups2"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 250
  keep_evaluations  = 0

  email_notifications = false
  email_override      = "domen@dev.si"
}

resource "hydra_jobset" "nixpkgs_pr-4943" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-4943"
  type        = "legacy"
  description = "Testing stdenv changing PR 4943"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/peti/nixpkgs.git make-4.x"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 600
  keep_evaluations  = 0

  email_notifications = false
  email_override      = "simons@cryp.to"
}

resource "hydra_jobset" "nixpkgs_pr-5091" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-5091"
  type        = "legacy"
  description = "Update Boost to version 1.57"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/wkennington/nixpkgs.git master.boost"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 250
  keep_evaluations  = 0

  email_notifications = false
  email_override      = "simons@cryp.to"
}

resource "hydra_jobset" "nixpkgs_pr-63493-meson-auto-features" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-63493-meson-auto-features"
  type        = "legacy"
  description = "PR 63493: Enable auto features for Meson"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/jtojnar/nixpkgs.git meson-auto-features"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 2000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-7465" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-7465"
  type        = "legacy"
  description = "https://github.com/NixOS/nixpkgs/pull/7465"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/peti/nixpkgs.git drop-obsolete-haskell-code"
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

resource "hydra_jobset" "nixpkgs_pr-82342" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-82342"
  type        = "legacy"
  description = "PR: rustPlatform checkPhase speed"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/Ma27/nixpkgs.git increase-rust-build-speed"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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

  check_interval    = 43200
  scheduling_shares = 1000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_pr-91557" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "pr-91557"
  type        = "legacy"
  description = "Testing ground for Haskell pr-91557"

  nix_expression {
    file  = "haskell-nixpkgs.nix"
    input = "ciSrc"
  }

  input {
    name              = "ciSrc"
    type              = "git"
    value             = "https://github.com/peti/ci"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs pr-91557"
    notify_committers = false
  }

  check_interval    = 14400
  scheduling_shares = 1
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_prs-6254-and-6166" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "prs-6254-and-6166"
  type        = "legacy"
  description = "kill libiconvOr* and cc-wrapper improvements"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/copumpkin/nixpkgs.git prs-6254-and-6166"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 600
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_python-rework" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "python-rework"
  type        = "legacy"
  description = "Rework of python support"

  nix_expression {
    file  = "pkgs/top-level/release-python.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/chaoflow/nixpkgs.git python"
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

  email_notifications = true
  email_override      = "python@chaoflow.net"
}

resource "hydra_jobset" "nixpkgs_python-unstable" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = false
  name        = "python-unstable"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = "pkgs/top-level/release-python.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs.git python-unstable"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 1000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_python3" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "python3"
  type        = "legacy"
  description = "https://git.io/vPXON"

  nix_expression {
    file  = "nixos/release-combined.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git python3"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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

resource "hydra_jobset" "nixpkgs_r-updates" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "r-updates"
  type        = "legacy"
  description = "Testing ground for updates to the R package set"

  nix_expression {
    file  = "pkgs/top-level/release-r.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git r-updates"
    notify_committers = false
  }

  check_interval    = 28800
  scheduling_shares = 600
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_release-17_03" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "release-17.03"
  type        = "legacy"
  description = "release-17.03"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-17.03"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 28800
  scheduling_shares = 300
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_staging" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "staging"
  type        = "legacy"
  description = "staging branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_staging-18_03" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "staging-18.03"
  type        = "legacy"
  description = "Staging-18.03 branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-18.03"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_staging-18_09" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "staging-18.09"
  type        = "legacy"
  description = "Staging-18.09 branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-18.09"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_staging-19_03" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "staging-19.03"
  type        = "legacy"
  description = "Staging-19.03 branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-19.03"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_staging-19_09" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "staging-19.09"
  type        = "legacy"
  description = "Staging-19.09 branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-19.09"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_staging-20_03" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "staging-20.03"
  type        = "legacy"
  description = "Staging 20.03"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-20.03"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_staging-20_09" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "staging-20.09"
  type        = "legacy"
  description = "Staging 20.09"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-20.09"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 2000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_staging-next" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "staging-next"
  type        = "legacy"
  description = "staging-next branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs.git staging-next"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"x86_64-darwin\" \"aarch64-linux\" \"aarch64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 43200
  scheduling_shares = 2000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_staging-next-21_05" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "staging-next-21.05"
  type        = "legacy"
  description = "Staging 21.05"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-next-21.05"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
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

  check_interval    = 172800
  scheduling_shares = 2000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_staging-next-21_11" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "staging-next-21.11"
  type        = "legacy"
  description = "Staging 21.11"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git staging-next-21.11"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\" \"aarch64-linux\" /*\"x86_64-darwin\"*/ ]"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 2000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_stdenv" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "stdenv"
  type        = "legacy"
  description = "Branch for stdenv changes"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
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
    name              = "system"
    type              = "string"
    value             = "x86_64-freebsd"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 500
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_stdenv-fixes" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "stdenv-fixes"
  type        = "legacy"
  description = "Trunk"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git stdenv-fixes"
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
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_structured-attrs" {
  project     = hydra_project.nixpkgs.name
  state       = "one-at-a-time"
  visible     = true
  name        = "structured-attrs"
  type        = "legacy"
  description = "no aarch64 due to reduced builders"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git structured-attrs"
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

  check_interval    = 0
  scheduling_shares = 600
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_syscall-tracing" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "syscall-tracing"
  type        = "legacy"
  description = "Trunk"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git syscall-tracing"
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

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_systemd" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = false
  name        = "systemd"
  type        = "legacy"
  description = "Trunk"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
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
    name              = "system"
    type              = "string"
    value             = "i686-linux"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_tmp-fetch-sources" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "tmp-fetch-sources"
  type        = "legacy"
  description = "TMP: fetch sources missing on Hydra"

  nix_expression {
    file  = "pkgs/top-level/fetch-sources.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/vcunat/nixpkgs.git p/fetch-sources"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 3000000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_toonn-wip" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "toonn-wip"
  type        = "legacy"
  description = "darwin playground"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/toonn/nixpkgs.git toonn-wip"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 10
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_trunk" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = true
  name        = "trunk"
  type        = "legacy"
  description = "master branch"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
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

  check_interval    = 28800
  scheduling_shares = 3000
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_vcunat-stdenv" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "vcunat-stdenv"
  type        = "legacy"
  description = "Vcunat's stdenv changes"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/vcunat/nixpkgs.git p/stdenv"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 200
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_xorg-test" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
  visible     = true
  name        = "xorg-test"
  type        = "legacy"
  description = "Branch for X11-related updates"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
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

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
