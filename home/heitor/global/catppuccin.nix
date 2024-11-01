{
  inputs,
  osConfig,
  pkgs,
  ...
}:
let
  inherit (osConfig.catppuccin) accent flavor;
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
