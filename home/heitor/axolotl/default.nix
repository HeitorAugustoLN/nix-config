{
  cosmicLib,
  inputs,
  pkgs,
  ...
}:
let
  inherit (cosmicLib.cosmic) mkRON;
in
{
  home = {
    packages = with pkgs; [
      spotify
      amberol
      fractal
      newsflash
      dialect
      mousai
      eartag
      eyedropper
      fragments
      # gaphor
      gnome-podcasts
      shortwave
      wike
      resources
      gimp
      godot-mono
      libresprite
    ];
    stateVersion = "25.11";
  };

  programs.obs-studio.enable = true;

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };

  wayland.desktopManager.cosmic = {
    # compositor.input_default = {
    #   scroll_config = mkRON "optional" {
    #     method = mkRON "optional" (mkRON "enum" "TwoFinger");
    #     natural_scroll = mkRON "optional" true;
    #     scroll_button = mkRON "optional" null;
    #     scroll_factor = mkRON "optional" null;
    #   };
    # };

    idle = {
      screen_off_time = mkRON "optional" null;
      suspend_on_ac_time = mkRON "optional" null;
      suspend_on_battery_time = mkRON "optional" null;
    };

    wallpapers = [
      {
        filter_by_theme = false;
        filter_method = mkRON "enum" "Lanczos";
        output = "HDMI-A-1";
        rotation_frequency = 300;
        sampling_method = mkRON "enum" "Alphanumeric";
        scaling_mode = mkRON "enum" "Zoom";

        source = mkRON "enum" {
          variant = "Path";
          value = [ inputs.wallpapers.desktop.by-theme.catppuccin.mocha.digital-art.eclipse ];
        };
      }
    ];
  };
}
