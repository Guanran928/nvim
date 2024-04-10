{
  lib,
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  runtimeDeps ? null,
  src ? null,
  ...
} @ args:
wrapNeovimUnstable neovim-unwrapped (neovimUtils.makeNeovimConfig args
  // {
    # FIXME: append instead of override the entire wrapperArgs
    wrapperArgs = ["--prefix" "PATH" ":" "${lib.makeBinPath runtimeDeps}"];
    luaRcContent = ''
      vim.cmd [[set runtimepath^=${src}]]
      ${builtins.readFile "${src}/init.lua"}
    '';
  })
