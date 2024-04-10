{
  description = "Guanran928's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### De-dupe flake dependencies
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      inherit (inputs.nixpkgs) lib;
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;

      runtimeDeps = with pkgs; [
        # mason / tree-sitter
        gcc
        cargo
        nodejs

        # telescope
        ripgrep
        fd
      ];
      src = lib.fileset.toSource {
        fileset = lib.fileset.fileFilter (file: file.hasExt "lua") ./.;
        root = ./.;
      };
    in {
      ### nix {run,shell,build}
      packages.default = pkgs.callPackage ./package.nix {inherit runtimeDeps src;};

      ### nix fmt
      formatter = treefmtEval.config.build.wrapper;

      ### nix flake check
      checks = {formatting = treefmtEval.config.build.check inputs.self;};

      ### nix develop
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          stylua
        ];
      };
    });
}
