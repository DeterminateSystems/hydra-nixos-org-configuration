resource "hydra_project" "kde" {
  name         = "kde"
  display_name = "KDE"
  homepage     = "http://www.kde.org"
  description  = "KDE"
  owner        = "rob.vermaas@gmail.com"
  enabled      = false
  visible      = false
}

resource "hydra_jobset" "kde_amarok-master" {
  project     = hydra_project.kde.name
  state       = "disabled"
  visible     = false
  name        = "amarok-master"
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
