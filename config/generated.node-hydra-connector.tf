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
  state       = "UNKNOWN"
  visible     = 
  name        = "node-hydra-connector-master"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
