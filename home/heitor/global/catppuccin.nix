{ inputs, osConfig, ... }:
let
  accent = osConfig.catppuccin.accent;
  flavor = osConfig.catppuccin.flavor;
in
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.catppuccin.plasmaManagerModules.catppuccin
  ];

  catppuccin = {
    inherit accent flavor;
    plasma = {
      inherit accent flavor;
    };
  };
}
