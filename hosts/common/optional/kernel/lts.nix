{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages;
}
