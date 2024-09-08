{ lib, pkgs, ... }:
{
  console = {
    enable = true;
    catppuccin.enable = true;
    # TODO Uncomment this when https://github.com/NixOS/nixpkgs/issues/257904 is fixed
    #font = "ter-v28b";
    keyMap = lib.mkDefault "br-abnt2";
    packages = with pkgs; [ terminus_font ];
  };
}
