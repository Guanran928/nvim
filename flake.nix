{
  description = "Guanran928's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      inherit (inputs.nixpkgs) lib;
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      runtimeDeps = with pkgs; [
        # mason / tree-sitter
        gcc
        cargo
      ];
    in {
      ### nix {run,shell,build}
      packages.default =
        pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped
        (pkgs.neovimUtils.makeNeovimConfig {
            customRC = ''
              set runtimepath^=${./.}
              source ${./.}/init.lua
            '';
          }
          // {wrapperArgs = ["--prefix" "PATH" ":" "${lib.makeBinPath runtimeDeps}"];});

      ### nix fmt
      formatter = inputs.nixpkgs.legacyPackages.${system}.alejandra;

      ### nix develop
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          stylua
        ];
      };
    });
}
