resource "hydra_project" "ofborg" {
  name         = "ofborg"
  display_name = "ofborg"
  homepage     = "https://github.com/NiXOS/ofborg"
  description  = "OfBorg automation"
  owner        = "graham@grahamc.com"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "ofborg_cole-flake" {
  project     = hydra_project.ofborg.name
  state       = "disabled"
  visible     = false
  name        = "cole-flake"
  type        = "flake"
  description = "Cole's work to make ofborg a flake."

  flake_uri = "github:cole-h/ofborg/flakeify"

  check_interval    = 3600
  scheduling_shares = 10000
  keep_evaluations  = 1

  email_notifications = false
  email_override      = ""
}

