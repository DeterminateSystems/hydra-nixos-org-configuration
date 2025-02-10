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
  state       = "disabled"
  visible     = false
  name        = "node-hydra-connector-master"
  type        = "legacy"
  description = ""

  nix_expression {
    file  = ""
    input = ""
  }

  check_interval    = 0
  scheduling_shares = 0
  keep_evaluations  = 0

  email_notifications = false
  email_override      = ""
}
