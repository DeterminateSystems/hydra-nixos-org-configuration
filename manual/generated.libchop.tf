resource "hydra_project" "libchop" {
  name         = "libchop"
  display_name = "libchop"
  homepage     = "http://nongnu.org/libchop/"
  description  = "libchop, tools & library for data backup and distributed storage"
  owner        = "ludo"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "libchop_master" {
  project     = hydra_project.libchop.name
  state       = "disabled"
  visible     = true
  name        = "master"
  type        = "legacy"
  description = "`master' branch of libchop"

  nix_expression {
    file  = "release.nix"
    input = "libchopSrc"
  }

  input {
    name              = "gnulib"
    type              = "git"
    value             = "git://git.sv.gnu.org/gnulib.git"
    notify_committers = false
  }

  input {
    name              = "guile"
    type              = "sysbuild"
    value             = "gnu:guile-2-0:build"
    notify_committers = false
  }

  input {
    name              = "libchopSrc"
    type              = "git"
    value             = "git://git.sv.gnu.org/libchop.git"
    notify_committers = false
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
