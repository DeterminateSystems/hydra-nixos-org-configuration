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
  visible     = false
  name        = "crawljax-trunk"
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
