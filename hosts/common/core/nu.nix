{ lib, pkgs, ... }:
{
  environment.shells =
    let
      inherit (pkgs) nushell;
    in
    [
      nushell
      (lib.getExe nushell)
    ];
}
