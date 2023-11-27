resource "hydra_project" "patchelf" {
  name         = "patchelf"
  display_name = "PatchELF"
  homepage     = "http://nixos.org/patchelf.html"
  description  = "A tool for modifying ELF binaries"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

resource "hydra_jobset" "patchelf_master" {
  project     = hydra_project.patchelf.name
  state       = "UNKNOWN"
  visible     = 
  name        = "master"
  type        = "UNKNOWN"
  description = ""

UNKNOWN INPUT TYPE

  check_interval    = 
  scheduling_shares = 
  keep_evaluations  = 

  email_notifications = 
  email_override      = ""
}
