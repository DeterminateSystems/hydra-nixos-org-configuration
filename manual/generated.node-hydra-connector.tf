resource "hydra_project" "node-hydra-connector" {
  name         = "node-hydra-connector"
  display_name = "Node Hydra connector"
  homepage     = ""
  description  = "Node module and CLI providing Hydra integration"
  owner        = "svanderburg"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "node-hydra-connector_node-hydra-connector-master" {
  project     = hydra_project.node-hydra-connector.name
  state       = "enabled"
  visible     = true
  name        = "node-hydra-connector-master"
  type        = "legacy"
  description = "Node Hydra connector master"

  nix_expression {
    file  = "release.nix"
    input = "node_hydra_connector"
  }

  input {
    name              = "nixpkgs"
    type              = "git"
    value             = "https://github.com/nixos/nixpkgs.git release-18.03"
    notify_committers = false
  }

  input {
    name              = "node_hydra_connector"
    type              = "git"
    value             = "https://github.com/svanderburg/node-hydra-connector.git"
    notify_committers = false
  }

  input {
    name              = "officialRelease"
    type              = "boolean"
    value             = "false"
    notify_committers = false
  }

  check_interval    = 300
  scheduling_shares = 1
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}
