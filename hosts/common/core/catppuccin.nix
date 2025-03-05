{ inputs, ... }:
{
  imports = [ inputs.catppuccin.nixosModules.catppuccin ];

  catppuccin = {
    accent = "mauve";
    flavor = "mocha";
  };
}
