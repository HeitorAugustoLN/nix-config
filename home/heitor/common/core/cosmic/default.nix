{ inputs, ... }:
{
  imports = [
    inputs.cosmic-manager.homeManagerModules.cosmic-manager

    ./apps/cosmic-edit.nix
    ./apps/cosmic-files.nix
    ./compositor.nix
    ./panels.nix
    ./shortcuts.nix
    ./theme
  ];

  wayland.desktopManager.cosmic.enable = true;
}
