{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  kara = pkgs.callPackage ./kara { };
}
