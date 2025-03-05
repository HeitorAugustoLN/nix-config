{ inputs, ... }:
{
  imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];

  catppuccin = {
    accent = "mauve";
    flavor = "mocha";
  };
}
