module "release_21_05" {
  source               = "./release"
  nixos_project_name   = hydra_project.nixos.name
  nixpkgs_project_name = hydra_project.nixpkgs.name
  release_yy_mm        = "21.05"

  released       = false
  staging_branch = "staging-next-21.05"
}
