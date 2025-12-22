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
      mullvad-browser
      proton-pass
      tor-browser
      godot-mono
      libresprite
      (
        let
          pname = "helium";
          version = "0.7.6.1";

          src = fetchurl {
            url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64.AppImage";
            hash = "sha256-SUpXcyQXUjZR57pNabVR/cSrGOMKvgzW0PSCLdB8d+E=";
          };

          appimageContents = appimageTools.extractType2 { inherit pname src version; };
        in
        appimageTools.wrapType2 {
          inherit pname src version;

          extraInstallCommands = ''
            install -Dm644 ${appimageContents}/usr/share/icons/hicolor/256x256/apps/helium.png \
              $out/share/icons/hicolor/256x256/apps/helium.png

            install -Dm644 ${appimageContents}/helium.desktop $out/share/applications/helium.desktop
            substituteInPlace $out/share/applications/helium.desktop \
              --replace-fail "Exec=AppRun" "Exec=helium"
          '';

          meta.mainProgram = "helium";
        }
      )
    ];
    stateVersion = "25.11";
  };

  programs.obs-studio.enable = true;

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
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
