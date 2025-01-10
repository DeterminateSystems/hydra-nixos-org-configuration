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

  check_interval    = 86400
  scheduling_shares = 10
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
  state       = "disabled"
  visible     = false
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

resource "hydra_jobset" "nixpkgs_glibc-bump" {
  project     = hydra_project.nixpkgs.name
  state       = "enabled"
  visible     = false
  name        = "glibc-bump"
  type        = "legacy"
  description = "See PR #342073: glibc: 2.39 -> 2.40"

  nix_expression {
    file  = "pkgs/top-level/release.nix"
    input = "nixpkgs"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/Ma27/nixpkgs.git bump-glibc"
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
    value             = "[ \"x86_64-linux\" /*\"aarch64-linux\"*/ ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 1
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
    value             = "https://github.com/NixOS/nixpkgs.git gnome"
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
    value             = "[ \"x86_64-linux\" /*\"aarch64-linux\" \"x86_64-darwin\" \"aarch64-darwin\"*/ ]"
    notify_committers = false
  }

  check_interval    = 0
  scheduling_shares = 1
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_gnome-stable" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
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
  keep_evaluations  = 0

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

  input {
    name              = "supportedSystems"
    type              = "nix"
    value             = "[ \"x86_64-linux\"  /* \"aarch64-linux\" \"x86_64-darwin\" \"aarch64-darwin\" */ ]"
    notify_committers = false
  }

  check_interval    = -28800
  scheduling_shares = 50
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
  state       = "disabled"
  visible     = false
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

  check_interval    = 0
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
  state       = "disabled"
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
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-21_05-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
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

  check_interval    = 86400
  scheduling_shares = 500
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "nixpkgs_nixpkgs-21_11-darwin" {
  project     = hydra_project.nixpkgs.name
  state       = "disabled"
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

  check_interval    = 172800
  scheduling_shares = 2
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}

