{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  toLanguagePack =
    locales:
    map (
      locale: builtins.replaceStrings [ "_" ] [ "-" ] (lib.strings.removeSuffix ".UTF-8/UTF-8" locale)
    ) locales;
in
{
  imports = [ inputs.betterfox.homeManagerModules.betterfox ];

  programs.firefox = {
    enable = true;

    betterfox = {
      enable = true;
      version = "main";
    };

    languagePacks = toLanguagePack osConfig.i18n.supportedLocales;
    nativeMessagingHosts = lib.optionals osConfig.services.desktopManager.plasma6.enable [
      pkgs.kdePackages.plasma-browser-integration
    ];

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

        # Automatically enable extensions
        "extensions.autoDisableScopes" = 0;
      };

      extensions =
        with pkgs.nur.repos.rycee.firefox-addons;
        [
          betterttv
          bitwarden
          catppuccin-gh-file-explorer
          darkreader
          dearrow
          firefox-color
          return-youtube-dislikes
          skip-redirect
          sponsorblock
          stylus
          ublock-origin
          violentmonkey
        ]
        ++ lib.optionals osConfig.services.desktopManager.plasma6.enable [
          plasma-integration
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
