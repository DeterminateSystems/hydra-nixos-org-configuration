#!/bin/sh

nix-shell ./importer/shell.nix --run "./importer/generator.sh https://hydra.nixos.org ./next ./next/import"
