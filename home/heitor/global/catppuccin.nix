{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.catppuccin.plasmaManagerModules.catppuccin
  ];

  catppuccin = {
    accent = "mauve";
    flavor = "mocha";
  };
}
