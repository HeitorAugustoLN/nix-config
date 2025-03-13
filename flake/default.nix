{ inputs, ... }:
{
  imports = [
    inputs.neovim.inputs.nixvim.flakeModule

    ./configurations.nix
    ./dev-shells.nix
    ./formatters.nix
    ./git-hooks.nix
    ../hosts
    ../modules
  ];
}
