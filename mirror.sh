#!/bin/sh

set -eux

rm -rf config
mkdir next
nix-shell ./importer/shell.nix --run "./importer/generator.sh https://hydra.nixos.org ./next ./next/import"

cat next/import | sort > next/import.sorted
mv next/import.sorted next/import

mv next config
git add config
git commit -m "Automatic re-import" || true

