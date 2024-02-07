resource "hydra_project" "gnu" {
  name         = "gnu"
  display_name = "GNU"
  homepage     = "http://www.gnu.org"
  description  = "GNU's Not Unix"
  owner        = "ludo"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "gnu_autoconf-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "autoconf-master"
  type        = "legacy"
  description = "GNU Autoconf"

  nix_expression {
    file  = "autoconf/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "autoconfSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/autoconf.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "gnu_automake-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "automake-master"
  type        = "legacy"
  description = "GNU Automake"

  nix_expression {
    file  = "automake/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "autoconf"
    type              = "sysbuild"
    value             = "autoconf-master:build"
    notify_committers = false
  }

  input {
    name              = "automakeSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/automake.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "gnu_bash-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "bash-master"
  type        = "legacy"
  description = "GNU Bourne Again Shell"

  nix_expression {
    file  = "bash/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "bashSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/bash.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_binutils-head" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "binutils-head"
  type        = "legacy"
  description = "GNU Binary Utilities"

  nix_expression {
    file  = "binutils/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "binutilsSrc"
    type              = "git"
    value             = "git://sources.redhat.com/git/binutils.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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

resource "hydra_jobset" "gnu_bison-maint" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "bison-maint"
  type        = "legacy"
  description = "GNU bison"

  nix_expression {
    file  = "bison/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "bison"
    type              = "git"
    value             = "git://git.sv.gnu.org/bison.git maint 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_bison-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "bison-master"
  type        = "legacy"
  description = "GNU bison"

  nix_expression {
    file  = "bison/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "bison"
    type              = "git"
    value             = "git://git.sv.gnu.org/bison.git master 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_bison-next" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "bison-next"
  type        = "legacy"
  description = "GNU bison"

  nix_expression {
    file  = "bison/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "bison"
    type              = "git"
    value             = "git://git.sv.gnu.org/bison.git next 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_ccd2cue" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "ccd2cue"
  type        = "legacy"
  description = "GNU ccd2cue"

  nix_expression {
    file  = "ccd2cue/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "ccd2cue"
    type              = "git"
    value             = "git://git.sv.gnu.org/ccd2cue.git master 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_coreutils-master" {
  project     = hydra_project.gnu.name
  state       = "enabled"
  visible     = true
  name        = "coreutils-master"
  type        = "legacy"
  description = "GNU Core Utilities"

  nix_expression {
    file  = "coreutils/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "coreutils"
    type              = "git"
    value             = "git://git.sv.gnu.org/coreutils.git master 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git master"
    notify_committers = false
  }

  check_interval    = 86400
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_cpio-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "cpio-master"
  type        = "legacy"
  description = "GNU cpio"

  nix_expression {
    file  = "cpio/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "cpioSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/cpio.git master 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
    notify_committers = false
  }

  input {
    name              = "paxutils"
    type              = "git"
    value             = "git://git.sv.gnu.org/paxutils.git master 1"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_cppi-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "cppi-master"
  type        = "legacy"
  description = "GNU cppi"

  nix_expression {
    file  = "cppi/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "cppi"
    type              = "git"
    value             = "git://git.sv.gnu.org/cppi.git master 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_datamash-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "datamash-master"
  type        = "legacy"
  description = "GNU Datamash"

  nix_expression {
    file  = "datamash/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "datamash"
    type              = "git"
    value             = "git://git.sv.gnu.org/datamash.git master 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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

resource "hydra_jobset" "gnu_diffutils-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "diffutils-master"
  type        = "legacy"
  description = "GNU diffutils"

  nix_expression {
    file  = "diffutils/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "diffutils"
    type              = "git"
    value             = "git://git.sv.gnu.org/diffutils.git master 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_emacs-24" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "emacs-24"
  type        = "legacy"
  description = "GNU emacs"

  nix_expression {
    file  = "emacs/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "emacs"
    type              = "git"
    value             = "git://git.sv.gnu.org/emacs.git emacs-24 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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

resource "hydra_jobset" "gnu_emacs-25" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "emacs-25"
  type        = "legacy"
  description = "GNU emacs"

  nix_expression {
    file  = "emacs/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "emacs"
    type              = "git"
    value             = "git://git.sv.gnu.org/emacs.git emacs-25 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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

resource "hydra_jobset" "gnu_emacs-trunk" {
  project     = hydra_project.gnu.name
  state       = "enabled"
  visible     = true
  name        = "emacs-trunk"
  type        = "legacy"
  description = "GNU emacs"

  nix_expression {
    file  = "emacs/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "emacs"
    type              = "git"
    value             = "git://git.sv.gnu.org/emacs.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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

  check_interval    = 864000
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_findutils-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "findutils-master"
  type        = "legacy"
  description = "GNU Find Utilities"

  nix_expression {
    file  = "findutils/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "findutilsSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/findutils.git master 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_gettext-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "gettext-master"
  type        = "legacy"
  description = "GNU gettext"

  nix_expression {
    file  = "gettext/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "gettext"
    type              = "git"
    value             = "git://git.sv.gnu.org/gettext.git master 1"
    notify_committers = false
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "gnu_glibc-hurd" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "glibc-hurd"
  type        = "legacy"
  description = "GNU C Library (Hurd repository)"

  nix_expression {
    file  = "glibc/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "glibcHurd"
    type              = "git"
    value             = "git://git.sv.gnu.org/hurd/glibc.git tschwinge/Roger_Whittaker 1"
    notify_committers = false
  }

  input {
    name              = "glibcPorts"
    type              = "git"
    value             = "git://sourceware.org/git/glibc-ports.git master 1"
    notify_committers = false
  }

  input {
    name              = "glibcSrc"
    type              = "git"
    value             = "git://sourceware.org/git/glibc.git master 1"
    notify_committers = false
  }

  input {
    name              = "hurdPatches"
    type              = "build"
    value             = "hurd_patches"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_glibc-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "glibc-master"
  type        = "legacy"
  description = "GNU C Library"

  nix_expression {
    file  = "glibc/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "glibcHurd"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "glibcPorts"
    type              = "git"
    value             = "git://sourceware.org/git/glibc-ports.git master 1"
    notify_committers = false
  }

  input {
    name              = "glibcSrc"
    type              = "git"
    value             = "git://sourceware.org/git/glibc.git master 1"
    notify_committers = false
  }

  input {
    name              = "hurdPatches"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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

resource "hydra_jobset" "gnu_gmp-5-0" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = false
  name        = "gmp-5-0"
  type        = "legacy"
  description = "GNU Multi-Precision Arithmetic Library 5.0.x"

  nix_expression {
    file  = "gmp/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "gmpSrc"
    type              = "hg"
    value             = "http://gmplib.org:8000/gmp-5.0"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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

resource "hydra_jobset" "gnu_gmp-default" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "gmp-default"
  type        = "legacy"
  description = "GNU Multi-Precision Arithmetic Library"

  nix_expression {
    file  = "gmp/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "gmp"
    type              = "hg"
    value             = "http://gmplib.org:8000/gmp"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "gnu_gnu-on-linux" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "gnu-on-linux"
  type        = "legacy"
  description = "NixOS GNU/Linux distro with the latest GNU packages"

  nix_expression {
    file  = "release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "coreutils"
    type              = "build"
    value             = "gnu:coreutils-master:tarball"
    notify_committers = false
  }

  input {
    name              = "cpio"
    type              = "build"
    value             = "gnu:cpio-master:tarball"
    notify_committers = false
  }

  input {
    name              = "emacs"
    type              = "build"
    value             = "gnu:emacs-trunk:tarball"
    notify_committers = false
  }

  input {
    name              = "glibc"
    type              = "build"
    value             = "gnu:glibc-master:tarball"
    notify_committers = false
  }

  input {
    name              = "grep"
    type              = "build"
    value             = "gnu:grep-master:tarball"
    notify_committers = false
  }

  input {
    name              = "guile"
    type              = "build"
    value             = "gnu:guile-2-0:tarball"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "inetutils"
    type              = "build"
    value             = "gnu:inetutils-master:tarball"
    notify_committers = false
  }

  input {
    name              = "nixos"
    type              = "git"
    value             = "https://github.com/NixOS/nixos.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
    notify_committers = false
  }

  input {
    name              = "patch"
    type              = "build"
    value             = "gnu:patch-master:tarball"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "x86_64-linux"
    notify_committers = false
  }

  input {
    name              = "tar"
    type              = "build"
    value             = "gnu:gnutar-master:tarball"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_gnumach-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "gnumach-master"
  type        = "legacy"
  description = "GNU Mach"

  nix_expression {
    file  = "gnumach/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "machSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/hurd/gnumach.git master 1"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_gnumach-user-level-drivers" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "gnumach-user-level-drivers"
  type        = "legacy"
  description = "GNU Mach, user-level drivers branch"

  nix_expression {
    file  = "gnumach/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "machSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/hurd/gnumach.git master-user_level_drivers 1"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_gnutar-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "gnutar-master"
  type        = "legacy"
  description = "GNU tar"

  nix_expression {
    file  = "tar/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
    notify_committers = false
  }

  input {
    name              = "paxutils"
    type              = "git"
    value             = "git://git.sv.gnu.org/paxutils.git master 1"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "x86_64-darwin"
    notify_committers = false
  }

  input {
    name              = "tarSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/tar.git master 1"
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

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_gnutls-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "gnutls-master"
  type        = "legacy"
  description = "GnuTLS"

  nix_expression {
    file  = "gnutls/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "gnutlsSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnutls.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "libgcrypt"
    type              = "sysbuild"
    value             = "libgcrypt-trunk:build"
    notify_committers = false
  }

  input {
    name              = "libtasn1"
    type              = "sysbuild"
    value             = "libtasn1-master:build"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "x86_64-freebsd"
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

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_grep-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "grep-master"
  type        = "legacy"
  description = "GNU Grep"

  nix_expression {
    file  = "grep/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git master 1"
    notify_committers = false
  }

  input {
    name              = "grep"
    type              = "git"
    value             = "git://git.sv.gnu.org/grep.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_gsasl-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "gsasl-master"
  type        = "legacy"
  description = "GNU SASL"

  nix_expression {
    file  = "gsasl/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "gsaslSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/gsasl.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "libgcrypt"
    type              = "sysbuild"
    value             = "gnu:libgcrypt-trunk:build"
    notify_committers = false
  }

  input {
    name              = "libidn"
    type              = "sysbuild"
    value             = "gnu:libidn-master:build"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://svn.nixos.org/repos/nix/nixpkgs/trunk"
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
  keep_evaluations  = 1

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "gnu_gsl-master" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "gsl-master"
  type        = "legacy"
  description = "GNU Scientific Library"

  nix_expression {
    file  = "gsl/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "gslSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/gsl.git master 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = true
  email_override      = ""
}

resource "hydra_jobset" "gnu_gsrc-testing" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "gsrc-testing"
  type        = "legacy"
  description = "GNU Source Release Collection, integration tests"

  nix_expression {
    file  = "gsrc/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "git://repo.or.cz/nixpkgs-libre.git t/nixpkgs-libre 1"
    notify_committers = false
  }

  input {
    name              = "system"
    type              = "string"
    value             = "i686-freebsd"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "gnu_guile-1-8" {
  project     = hydra_project.gnu.name
  state       = "disabled"
  visible     = true
  name        = "guile-1-8"
  type        = "legacy"
  description = "GNU Guile, version 1.8"

  nix_expression {
    file  = "guile/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "guile"
    type              = "git"
    value             = "git://git.sv.gnu.org/guile.git branch_release-1-8 1"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "git"
    value             = "git://git.savannah.gnu.org/hydra-recipes.git"
    notify_committers = false
  }

  input {
    name              = "native_guile"
    type              = "sysbuild"
    value             = "build"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs-channels.git nixos-18.09"
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
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

