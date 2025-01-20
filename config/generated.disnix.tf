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

resource "hydra_jobset" "disnix_WebServicesExample-trunk" {
  project     = hydra_project.disnix.name
  state       = "disabled"
  visible     = true
  name        = "WebServicesExample-trunk"
  type        = "legacy"
  description = "Web Services Example trunk"

  nix_expression {
    file  = "release.nix"
    input = "WebServicesExample"
  }

  input {
    name              = "WebServicesExample"
    type              = "git"
    value             = "https://github.com/svanderburg/disnix-stafftracker-java-example.git"
    notify_committers = false
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
    value             = "true"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "disnix_WebServicesExampleNET-trunk" {
  project     = hydra_project.disnix.name
  state       = "disabled"
  visible     = true
  name        = "WebServicesExampleNET-trunk"
  type        = "legacy"
  description = "Web Services Example .NET version trunk"

  nix_expression {
    file  = "release.nix"
    input = "disnix_stafftracker_dotnet_example"
  }

  input {
    name              = "disnix_stafftracker_dotnet_example"
    type              = "git"
    value             = "https://github.com/svanderburg/disnix-stafftracker-dotnet-example.git"
    notify_committers = false
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
    value             = "true"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "disnix_disnix-activation-scripts-trunk" {
  project     = hydra_project.disnix.name
  state       = "disabled"
  visible     = false
  name        = "disnix-activation-scripts-trunk"
  type        = "legacy"
  description = "Disnix activation scripts trunk"

  nix_expression {
    file  = "release.nix"
    input = "disnix_activation_scripts"
  }

  input {
    name              = "catalinaBaseDir"
    type              = "string"
    value             = "/var/tomcat"
    notify_committers = false
  }

  input {
    name              = "disnix_activation_scripts"
    type              = "svn"
    value             = "https://nixos.org/repos/nix/disnix/disnix-activation-scripts/trunk"
    notify_committers = false
  }

  input {
    name              = "enableApacheWebApplication"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "enableAxis2WebService"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "enableEjabberdDump"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "enableMySQLDatabase"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "enablePostgreSQLDatabase"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "enableSubversionRepository"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  input {
    name              = "enableTomcatWebApplication"
    type              = "boolean"
    value             = "false"
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
  email_override      = "s.vanderburg@tudelft.nl"
}

resource "hydra_jobset" "disnix_disnix-composition-example-master" {
  project     = hydra_project.disnix.name
  state       = "disabled"
  visible     = true
  name        = "disnix-composition-example-master"
  type        = "legacy"
  description = "Demonstrates various ways to compose services together with Disnix"

  nix_expression {
    file  = "release.nix"
    input = "disnix_composition_example"
  }

  input {
    name              = "disnix_composition_example"
    type              = "git"
    value             = "https://github.com/svanderburg/disnix-composition-example.git"
    notify_committers = false
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
    value             = "true"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "disnix_disnix-proxy-example-trunk" {
  project     = hydra_project.disnix.name
  state       = "disabled"
  visible     = true
  name        = "disnix-proxy-example-trunk"
  type        = "legacy"
  description = "Disnix proxy example trunk"

  nix_expression {
    file  = "release.nix"
    input = "disnix_proxy_example"
  }

  input {
    name              = "disnix_proxy_example"
    type              = "git"
    value             = "https://github.com/svanderburg/disnix-proxy-example.git"
    notify_committers = false
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
    value             = "true"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 100
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

resource "hydra_jobset" "disnix_disnix-trunk" {
  project     = hydra_project.disnix.name
  state       = "enabled"
  visible     = true
  name        = "disnix-trunk"
  type        = "legacy"
  description = "Disnix trunk"

  nix_expression {
    file  = "release.nix"
    input = "disnix"
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
    value             = "[ \"i686-linux\" \"x86_64-linux\" \"x86_64-darwin\" ]"
    notify_committers = false
  }

  check_interval    = 172800
  scheduling_shares = 10
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

