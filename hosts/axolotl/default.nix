{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./disk-configuration.nix
    # ./hardware-configuration.nix
    ../common/users/heitor
    inputs.disko.nixosModules.disko
    inputs.nixos-facter-modules.nixosModules.facter
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  networking.firewall.checkReversePath = false;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  i18n.inputMethod.enable = true;
  i18n.inputMethod.type = "ibus";

  facter.reportPath = ./facter.json;
  facter.detected.dhcp.enable = false;

  environment.systemPackages = [
    (pkgs.kdePackages.kdenlive.overrideAttrs (oldAttrs: {
      qtWrapperArgs = oldAttrs.qtWrapperArgs ++ [
        "--prefix PATH : ${
          lib.makeBinPath [
            (pkgs.python3.withPackages (
              ps: with ps; [
                opencv4
                requests
                numpy
                openai-whisper
                torch
                srt
                sam2
              ]
            ))
          ]
        }"
        "--suffix XDG_DATA_DIRS : ${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
      ];
    }))
  ];

  xdg.terminal-exec = {
    enable = true;
    settings.default = [ "ghostty.desktop" ];
  };

  system.stateVersion = "25.11";
}
