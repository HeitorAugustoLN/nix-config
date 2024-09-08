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
    ./powerdevil.nix # Power management
    ./shortcuts.nix # Shortcuts
    ./theme.nix # Colorschemes, Cursors, Fonts, Icons, Sounds and Wallpaper.
    ./tiling.nix # Tiling
    ./window-rules.nix # Window rules
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    windows = {
      allowWindowsToRememberPositions = true;
    };
  };
}
