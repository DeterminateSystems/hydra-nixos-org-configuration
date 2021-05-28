#!/bin/sh

export LANG=en_US.UTF-8

set -eux

rm -rf importer
git clone https://github.com/DeterminateSystems/terraform-provider-hydra.git
ln -s ./terraform-provider-hydra/tools ./importer

rm -rf config
mkdir next
nix-shell ./importer/shell.nix --run "./importer/generator.sh https://hydra.nixos.org ./next ./next/import"

nix-shell ./importer/shell.nix --run "cat next/import | sort > next/import.sorted"
mv next/import.sorted next/import

mv next config

