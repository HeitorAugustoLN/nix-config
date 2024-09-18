{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (catppuccin-where-is-my-sddm-theme.override {
      flavor = config.catppuccin.flavor;
    })
  ];
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    theme = "where_is_my_sddm_theme";
    wayland.enable = true;
  };
}
