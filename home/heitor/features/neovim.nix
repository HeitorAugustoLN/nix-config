# TODO: Move this to a better place
{ inputs, pkgs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
  myNeovim = inputs.neovim.packages.${system}.default;
in
{
  home.packages = [ myNeovim ];
}
