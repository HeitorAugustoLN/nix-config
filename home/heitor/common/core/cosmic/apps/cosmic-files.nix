{ config, cosmicLib, ... }:
let
  inherit (cosmicLib.cosmic) mkRON;
in
{
  programs.cosmic-files = {
    enable = true;
    package = null;

    settings = {
      app_theme = mkRON "enum" "System";

      desktop = {
        grid_spacing = 100;
        icon_size = 100;
        show_content = false;
        show_mounted_drives = false;
        show_trash = false;
      };

      favorites = [
        (mkRON "enum" "Home")
        (mkRON "enum" "Documents")
        (mkRON "enum" "Downloads")
        (mkRON "enum" "Music")
        (mkRON "enum" "Pictures")
        (mkRON "enum" "Videos")
        (mkRON "enum" {
          variant = "Path";
          value = [ "${config.home.homeDirectory}/Projects" ];
        })
      ];

      show_details = false;

      tab = {
        folders_first = true;

        icon_sizes = {
          grid = 100;
          list = 100;
        };

        show_hidden = true;
        view = mkRON "enum" "List";
      };
    };
  };
}
