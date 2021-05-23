variable "nixos_project_name" {
    type = string
}

variable "nixpkgs_project_name" {
    type = string
}

variable "release_yy_mm" {
    type = string
}

variable "staging_branch" {
    type = string
    default = ""
}

variable "released" {
    type = bool
}

locals {
    staging_branch = (var.staging_branch == "") ? "staging-${var.release_yy_mm}" : var.staging_branch
    stableBranch = var.released ? "true" : "false"
}
