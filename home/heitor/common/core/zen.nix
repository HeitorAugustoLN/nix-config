{ pkgs, ... }:
{
  # Zen browser configuration
  # Zen is a Firefox-based browser with enhanced privacy features
  # Since zen-browser might not be available in nixpkgs, we configure Firefox
  # which can be used as a base for zen browser or as a standalone browser
  
  # Configure Firefox with extensions and settings similar to the original Brave setup
  programs.firefox = {
    enable = true;
    
    profiles.default = {
      id = 0;
      isDefault = true;
      
      # Extensions compatible with Firefox-based browsers
      # These are equivalent to the original Brave extensions
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        # Bitwarden - Password manager (equivalent to Brave's Bitwarden)
        bitwarden
        # Dark Reader - Dark mode for websites
        darkreader
        # LanguageTool - Grammar and spell checker
        languagetool
        # Return YouTube dislike - Show YouTube dislike counts
        return-youtube-dislikes
        # Skip redirect - Skip redirect pages
        skip-redirect
        # Sponsorblock for YouTube - Skip YouTube sponsors
        sponsorblock
        # Stylus - User styles manager
        stylus
        # Violentmonkey - Userscript manager
        violentmonkey
      ];
      
      settings = {
        # Privacy and performance settings
        "browser.startup.homepage" = "about:blank";
        "browser.newtabpage.enabled" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.trackingprotection.cryptomining.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        
        # Additional privacy settings for Firefox
        "privacy.donottrackheader.enabled" = true;
        "privacy.usercontext.about_newtab_segregation.enabled" = true;
        "browser.contentblocking.category" = "strict";
      };
    };
  };

  # Enable Catppuccin theme for Firefox
  catppuccin.firefox.enable = true;
}