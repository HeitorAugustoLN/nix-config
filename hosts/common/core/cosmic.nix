{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
    cosmic-player
    cosmic-store
    cosmic-term
  ];

  networking.networkmanager.enable = true;

  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };
}
