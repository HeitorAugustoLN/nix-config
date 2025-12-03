{ inputs, pkgs, ... }:
{
  imports = [
    ./disk-configuration.nix
    # ./hardware-configuration.nix
    ../common/users/heitor
    inputs.disko.nixosModules.disko
    inputs.nixos-facter-modules.nixosModules.facter
  ];

  networking.firewall.checkReversePath = false;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  i18n.inputMethod.enable = true;
  i18n.inputMethod.type = "ibus";

  facter.reportPath = ./facter.json;
  facter.detected.dhcp.enable = false;

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
