{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme
  ];
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    theme = "where_is_my_sddm_theme";
    wayland.enable = true;
  };
}
