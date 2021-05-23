module "release_20_09" {
  source               = "./release"
  nixos_project_name   = hydra_project.nixos.name
  nixpkgs_project_name = hydra_project.nixpkgs.name
  release_yy_mm        = "20.09"
  released             = true
}
