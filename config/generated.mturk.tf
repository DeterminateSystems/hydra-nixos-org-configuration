resource "hydra_project" "mturk" {
  name         = "mturk"
  display_name = "MTurk"
  homepage     = ""
  description  = "Amazon Mechanical Turk tests"
  owner        = "eelco"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "mturk_kde" {
  project     = hydra_project.mturk.name
  state       = "disabled"
  visible     = true
  name        = "kde"
  type        = "legacy"
  description = "KDE tests"

  nix_expression {
    file  = "kde-tests.nix"
    input = "mturk"
  }

  input {
    name              = "mturk"
    type              = "svn"
    value             = "https://nixos.org/repos/varia/trunk/papers/icse-2012/evaluation/tests"
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
    value             = "https://github.com/NixOS/nixpkgs.git"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "mturk_tribler-5-4-x" {
  project     = hydra_project.mturk.name
  state       = "disabled"
  visible     = true
  name        = "tribler-5-4-x"
  type        = "legacy"
  description = "Tribler test (5.4.x branch)"

  nix_expression {
    file  = "tribler-test.nix"
    input = "mturk"
  }

  input {
    name              = "mturk"
    type              = "svn"
    value             = "https://nixos.org/repos/varia/trunk/papers/icse-2012/evaluation/tests"
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
    value             = "https://github.com/NixOS/nixpkgs.git"
    notify_committers = false
  }

  input {
    name              = "tribler"
    type              = "svn"
    value             = "http://svn.tribler.org/abc/branches/release-5.4.x"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}

resource "hydra_jobset" "mturk_xfce" {
  project     = hydra_project.mturk.name
  state       = "disabled"
  visible     = true
  name        = "xfce"
  type        = "legacy"
  description = "Xfce tests"

  nix_expression {
    file  = "xfce-tests.nix"
    input = "mturk"
  }

  input {
    name              = "mturk"
    type              = "svn"
    value             = "https://nixos.org/repos/varia/trunk/papers/icse-2012/evaluation/tests"
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
    value             = "https://github.com/NixOS/nixpkgs.git"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "eelco.dolstra@logicblox.com"
}
