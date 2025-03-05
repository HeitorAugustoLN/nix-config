{ lib, ... }:
let
  inherit (lib) mkDefault;
in
{
  catppuccin.tty.enable = true;
  console.keyMap = mkDefault "br-abnt2";
}
