{
  inputs,
  osConfig,
  pkgs,
  ...
}:
let
  accent = osConfig.catppuccin.accent;
  flavor = osConfig.catppuccin.flavor;
in
{
  imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];

  catppuccin = {
    inherit accent flavor;
  };

  home.packages = with pkgs; [
    catppuccin-catwalk # Tool for generating preview images for Catppuccin themes
    catppuccin-whiskers # Catppuccin port creation helper tool
  ];
}
