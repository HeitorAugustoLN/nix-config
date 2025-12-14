{ lib, pkgs, ... }:
{
  environment.shells = [
    pkgs.nushell
    (lib.getExe pkgs.nushell)
  ];
}
