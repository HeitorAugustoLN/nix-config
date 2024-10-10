{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  vinegar = pkgs.callPackage ./vinegar { };
}
