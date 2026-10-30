{
  description = "Bolun Thompson CV (LaTeX)";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-weekly/*.tar.gz";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        tex = pkgs.texliveMedium.withPackages (ps: with ps; [
          latexmk
          moderncv
          multiaudience
          fontawesome5
          academicons
          enumitem
          xstring
          arydshln
          etoolbox
          environ
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            tex
            pkgs.just
            pkgs.texlab
            pkgs.sioyek
          ];
        };
      });
}
