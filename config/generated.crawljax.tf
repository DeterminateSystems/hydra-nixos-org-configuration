resource "hydra_project" "crawljax" {
  name         = "crawljax"
  display_name = "Crawljax"
  homepage     = "http://spci.st.ewi.tudelft.nl"
  description  = "Crawljax"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "crawljax_crawljax-trunk" {
  project     = hydra_project.crawljax.name
  state       = "disabled"
  visible     = true
  name        = "crawljax-trunk"
  type        = "legacy"
  description = "Crawljax"

  nix_expression {
    file  = "crawljax/release.nix"
    input = "hydraConfig"
  }

  input {
    name              = "build"
    type              = "build"
    value             = "build"
    notify_committers = false
  }

  input {
    name              = "crawljaxSrc"
    type              = "svn"
    value             = "http://crawljax.googlecode.com/svn/trunk"
    notify_committers = false
  }

  input {
    name              = "hydraConfig"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/hydra-config/tud/trunk"
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
    name              = "services"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/services/trunk"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 0

  email_notifications = true
  email_override      = "rob.vermaas@gmail.com"
}
