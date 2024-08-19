{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager

    ./apps/kate.nix # Text editor
    ./apps/konsole.nix # Terminal

    ./kscreenlocker.nix # Screen locker
    ./kwin.nix # Effects, Night light, titlebar, virtual desktops
    ./panels.nix # Panels
    ./powerdevil.nix # Power management
    ./theme.nix # Colorschemes, Cursors, Fonts, Icons, Sounds and Wallpaper.
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    windows = {
      allowWindowsToRememberPositions = true;
    };
  };
}
