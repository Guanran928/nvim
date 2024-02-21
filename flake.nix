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
      packages.default =
        pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped
        (pkgs.neovimUtils.makeNeovimConfig {
            customRC = ''
              set runtimepath^=${./.}
              source ${./.}/init.lua
            '';
          }
          // {wrapperArgs = ["--prefix" "PATH" ":" "${lib.makeBinPath runtimeDeps}"];});

      devShells.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          stylua
        ];
      };
    });
}
