{
  description = "Guanran928's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
      in
      {
        ### nix fmt
        formatter = treefmtEval.config.build.wrapper;

        ### nix flake check
        checks.formatting = treefmtEval.config.build.check inputs.self;

        ### nix develop
        devShells.default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            lua-language-server
            stylua
          ];
        };
      }
    );
}
