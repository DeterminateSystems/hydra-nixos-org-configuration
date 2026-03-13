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
  state       = "enabled"
  visible     = true
  name        = "master"
  type        = "flake"
  description = "PatchELF trunk jobs"

  flake_uri = "github:NixOS/patchelf"

  check_interval    = 7200
  scheduling_shares = 100
  keep_evaluations  = 3

  email_notifications = false
  email_override      = ""
}
