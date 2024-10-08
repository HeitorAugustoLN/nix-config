{ inputs, ... }:
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager

    ./apps/kate.nix # Text editor
    ./apps/konsole.nix # Terminal

    ./krunner.nix # KRunner
    ./kscreenlocker.nix # Screen locker
    ./kwin.nix # Effects, Night light, titlebar, virtual desktops
    ./panels.nix # Panels
    ./shortcuts.nix # Shortcuts
    ./theme.nix # Colorschemes, Cursors, Fonts, Icons, Sounds and Wallpaper.
    ./tiling.nix # Tiling
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    windows = {
      allowWindowsToRememberPositions = true;
    };
  };
}
