resource "hydra_project" "disnix" {
  name         = "disnix"
  display_name = "Disnix"
  homepage     = "http://nixos.org/disnix"
  description  = "Disnix, a Nix-based distributed service deployment tool"
  owner        = "svanderburg"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "disnix_DisnixWebService-trunk" {
  project     = hydra_project.disnix.name
  state       = "enabled"
  visible     = true
  name        = "DisnixWebService-trunk"
  type        = "legacy"
  description = "Disnix Web Service interface trunk"

  nix_expression {
    file  = "release.nix"
    input = "DisnixWebService"
  }

  input {
    name              = "DisnixWebService"
    type              = "git"
    value             = "https://github.com/svanderburg/DisnixWebService.git"
    notify_committers = false
  }

  input {
    name              = "disnix"
    type              = "git"
    value             = "https://github.com/svanderburg/disnix.git"
    notify_committers = false
  }

  input {
    name              = "dysnomia"
    type              = "git"
    value             = "https://github.com/svanderburg/dysnomia.git"
    notify_committers = false
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/NixOS/nixpkgs.git release-23.05"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "true"
    notify_committers = false
  }

  input {
    name              = "systems"
    type              = "nix"
    value             = "[ \"i686-linux\" \"x86_64-linux\" ]"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 10
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

