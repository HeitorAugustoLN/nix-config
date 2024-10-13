{
  config,
  inputs,
  pkgs,
  ...
}:
let
  catppuccinFlavor = config.catppuccin.flavor;
in
{
  environment.systemPackages = [
    (pkgs.catppuccin-where-is-my-sddm-theme.override {
      flavor = catppuccinFlavor;
      settings = {
        General = {
          background = "";
          blurRadius = 0;
          backgroundFillMode = "aspect";
          cursorBlinkAnimation = true;
          hideCursor = false;
          passwordAllowEmpty = false;
          passwordCharacter = "*";
          passwordFontSize = 32;
          passwordInputBackground = inputs.catppuccin-palette.palette.${catppuccinFlavor}.colors.surface0.hex;
          passwordInputCursorVisible = true;
          passwordInputRadius = 10;
          passwordInputWidth = 0.5;
          passwordMask = true;
          sessionsFontSize = 24;
          showSessionsByDefault = true;
          showUserRealNameByDefault = true;
          showUsersByDefault = true;
          usersFontSize = 32;
        };
      };
    })
  ];
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      theme = "where_is_my_sddm_theme";
      wayland.enable = true;
    };
  };
}
