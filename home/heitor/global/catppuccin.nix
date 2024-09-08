{ inputs, osConfig, ... }:
let
  accent = osConfig.catppuccin.accent;
  flavor = osConfig.catppuccin.flavor;
in
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  catppuccin = {
    inherit accent flavor;
  };
}
