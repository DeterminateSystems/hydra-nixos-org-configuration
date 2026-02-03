resource "hydra_project" "cabal2nix" {
  name         = "cabal2nix"
  display_name = "cabal2nix"
  homepage     = "http://github.com/NixOS/cabal2nix"
  description  = "Convert Cabal files into Nix build instructions"
  owner        = "simons@cryp.to"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "cabal2nix_master" {
  project     = hydra_project.cabal2nix.name
  state       = "disabled"
  visible     = false
  name        = "master"
  type        = "legacy"
  description = "master branch"

  nix_expression {
    file  = "cabal2nix.nix"
    input = "ciSrc"
  }

  input {
    name              = "cabal2nixSrc"
    type              = "git"
    value             = "https://github.com/NixOS/cabal2nix.git"
    notify_committers = false
  }

  input {
    name              = "ciSrc"
    type              = "git"
    value             = "https://github.com/peti/ci.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git"
    notify_committers = false
  }

  check_interval    = 3600
  scheduling_shares = 50000
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
