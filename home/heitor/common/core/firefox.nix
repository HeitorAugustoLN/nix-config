{
  inputs,
  inputs',
  pkgs,
  ...
}:
{
  imports = [ inputs.arkenfox-nix.homeModules.arkenfox ];

  home.file.".mozilla/firefox/heitor/chrome/firefox-gnome-theme".source = pkgs.fetchFromGitHub {
    name = "firefox-gnome-theme";
    owner = "rafaelmardojai";
    repo = "firefox-gnome-theme";
    rev = "f7ffd917ac0d253dbd6a3bf3da06888f57c69f92";
    hash = "sha256-1XPewtGMi+9wN9Ispoluxunw/RwozuTRVuuQOmxzt+A=";
  };

  programs.firefox = {
    enable = true;

    arkenfox = {
      enable = true;

      profiles.heitor.settings = {
        "0000".enable = true;
        "0100".enable = true;
      };
    };

    profiles.heitor = {
      extensions.packages = [ inputs'.firefox-addons.packages.ublock-origin ];
      isDefault = true;
      name = "Heitor";

      settings = {
        "browser.theme.dark-private-windows" = false;
        "browser.uiCustomization.state" = builtins.toJSON {
          currentVersion = 23;

          dirtyAreaCache = [
            "nav-bar"
            "vertical-tabs"
            "PersonalToolbar"
            "toolbar-menubar"
            "TabsToolbar"
          ];

          newElementCount = 6;

          placements = {
            PersonalToolbar = [ ];

            TabsToolbar = [
              "tabbrowser-tabs"
              "alltabs-button"
            ];

            nav-bar = [
              "back-button"
              "forward-button"
              "stop-reload-button"
              "new-tab-button"
              "customizableui-special-spring1"
              "vertical-spacer"
              "urlbar-container"
              "customizableui-special-spring2"
              "downloads-button"
              "unified-extensions-button"
            ];

            toolbar-menubar = [ "menubar-items" ];
            unified-extensions-area = [ ];
            vertical-tabs = [ ];
            widget-overflow-fixed-list = [ ];
          };

          seen = [
            "developer-button"
            "screenshot-button"
          ];
        };

        "browser.uidensity" = 0;
        "gnomeTheme.hideSingleTab" = true;
        "svg.context-properties.content.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "widget.gtk.rounded-bottom-corners.enabled" = true;
      };

      userChrome = ''@import "firefox-gnome-theme/userChrome.css";'';
      userContent = ''@import "firefox-gnome-theme/userContent.css";'';
    };
  };
}
