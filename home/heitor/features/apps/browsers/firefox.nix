{ inputs, pkgs, ... }:
{
  imports = [ inputs.betterfox.homeManagerModules.betterfox ];

  programs.firefox = {
    enable = true;

    betterfox = {
      enable = true;
      version = "129.0";
    };

    languagePacks = [ "pt-BR" ];
    nativeMessagingHosts = with pkgs; [ plasma-browser-integration ];

    profiles.Heitor = {
      isDefault = true;
      name = "Heitor Augusto";

      betterfox = {
        enable = true;
        enableAllSections = true;
        smoothfox = {
          enable = true;
          instant-scrolling.enable = true;
        };
      };
      settings = {
        # Disable Firefox Sync, It is not needed because of home-manager
        "identity.fxaccounts.enabled" = false;

        # Disable login manager
        "signon.rememberSignons" = false;
        # Disable address and credit card manager
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;

        # Disable disk cache
        "browser.cache.disk.enable" = false;

        # Enable DRM by default
        "browser.eme.ui.enabled" = true;
        "media.eme.enabled" = true;

        # Toolbar customization
        "browser.uiCustomization.state" = builtins.toJSON {
          currentVersion = 20;
          dirtyAreaCache = [
            "unified-extensions-area"
            "nav-bar"
          ];
          newElementCount = 28;
          placements = {
            nav-bar = [
              "back-button"
              "forward-button"
              "stop-reload-button"
              "home-button"
              "customizableui-special-spring1"
              "save-to-pocket-button"
              "urlbar-container"
              "customizableui-special-spring2"
              "addon_darkreader_org-browser-action"
              "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
              "fxa-toolbar-menu-button"
              "unified-extensions-button"
              "screenshot-button"
              "developer-button"
              "library-button"
              "ublock0_raymondhill_net-browser-action"
            ];
            PersonalToolbar = [
              "personal-bookmarks"
            ];
            TabsToolbar = [
              "firefox-view-button"
              "tabbrowser-tabs"
              "new-tab-button"
              "alltabs-button"
            ];
            toolbar-menubar = [
              "menubar-items"
            ];
            unified-extensions-area = [
              "firefoxcolor_mozilla_com-browser-action"
              "plasma-browser-integration_kde_org-browser-action"
              "skipredirect_sblask-browser-action"
              "_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action"
              "_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action"
              "_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action"
              "sponsorblocker_ajay_app-browser-action"
              "dearrow_ajay_app-browser-action"
            ];
            widget-overflow-fixed-list = [ ];
          };
          seen = [
            "firefoxcolor_mozilla_com-browser-action"
            "addon_darkreader_org-browser-action"
            "plasma-browser-integration_kde_org-browser-action"
            "skipredirect_sblask-browser-action"
            "ublock0_raymondhill_net-browser-action"
            "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
            "_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action"
            "_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action"
            "_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action"
            "sponsorblocker_ajay_app-browser-action"
            "dearrow_ajay_app-browser-action"
            "developer-button"
          ];
        };
      };

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        darkreader
        dearrow
        firefox-color
        plasma-integration
        return-youtube-dislikes
        skip-redirect
        sponsorblock
        stylus
        ublock-origin
        violentmonkey
      ];

      search = {
        force = true;
        default = "DuckDuckGo";
        privateDefault = "DuckDuckGo";

        engines =
          let
            mkEngine = alias: template: {
              definedAliases = [ "@${alias}" ];
              urls = [ { inherit template; } ];
            };
          in
          {
            "DuckDuckGo" = mkEngine "duckduckgo" "https://duckduckgo.com/?q={searchTerms}";
            "Google" = mkEngine "google" "https://www.google.com/search?q={searchTerms}";
            "Bing".metaData.hidden = true;
          };
      };
    };
  };
}
