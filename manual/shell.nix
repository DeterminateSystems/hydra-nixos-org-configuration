let pkgs = import <nixpkgs> { }; in
pkgs.mkShell {
  buildInputs = with pkgs; [
    (terraform_0_14.withPlugins (p: with p; [ p.hydra ]))

  ];
}
