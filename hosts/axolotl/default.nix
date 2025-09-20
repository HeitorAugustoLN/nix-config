{ inputs, ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ../common/users/heitor

    inputs.disko.nixosModules.disko
    inputs.nixos-hardware.nixosModules.common-cpu-intel-cpu-only
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  networking.firewall.checkReversePath = false;

  system.stateVersion = "25.11";
}
