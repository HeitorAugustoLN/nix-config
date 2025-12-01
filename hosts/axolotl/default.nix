{ inputs, pkgs, ... }:
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

  networking.firewall.checkReversePath = false;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  i18n.inputMethod.enable = true;
  i18n.inputMethod.type = "ibus";

  environment.systemPackages = [ pkgs.davinci-resolve ];

  xdg.terminal-exec = {
    enable = true;
    settings.default = [ "ghostty.desktop" ];
  };

  hardware.graphics = {
    enable = true;
    extraPackages = [ pkgs.rocmPackages.clr.icd ];
  };

  system.stateVersion = "25.11";
}
