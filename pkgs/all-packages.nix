{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  catppuccin-where-is-my-sddm-theme = pkgs.callPackage ./catppuccin-where-is-my-sddm-theme { };
}
