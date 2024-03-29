{
  projectRootFile = "flake.nix";

  ### nix
  programs.deadnix.enable = true;
  programs.statix.enable = true;
  programs.alejandra.enable = true;

  ### lua
  programs.stylua.enable = true;

  ### toml
  programs.taplo.enable = true;

  ### misc
  programs.prettier.enable = true;
}
