resource "hydra_project" "patchelf" {
  name         = "patchelf"
  display_name = "PatchELF"
  homepage     = "http://nixos.org/patchelf.html"
  description  = "A tool for modifying ELF binaries"
  owner        = "eelco"
  enabled      = true
  visible      = true
}

