resource "hydra_project" "linux-on-mac-builder" {
  name         = "linux-on-mac-builder"
  display_name = "Linux on Mac builder"
  homepage     = "https://github.com/nix-community/linuxkit-builder/"
  description  = "An easy to use Linux builder for macOS"
  owner        = "graham@grahamc.com"
  enabled      = false
  visible      = true
}

