{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  kara = pkgs.callPackage ./kara { };
  catppuccin-where-is-my-sddm-theme = pkgs.callPackage ./catppuccin-where-is-my-sddm-theme { };
}
