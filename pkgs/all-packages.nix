{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  hydralauncher = pkgs.callPackage ./hydralauncher { };
  vinegar = pkgs.callPackage ./vinegar { };
}
