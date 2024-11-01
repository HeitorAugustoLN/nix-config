{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  catppuccinFlavor = config.catppuccin.flavor;
  catppuccinThemeId = {
    frappe = "olhelnoplefjdmncknfphenjclimckaf";
    latte = "jhjnalhegpceacdhbplhnakmkdliaddd";
    macchiato = "cmpdlhmnmjhihmcfnigoememnffkimlk";
    mocha = "bkkmolkhemgaeaeggcmfbghljjjoofoh";
  };
in
{
  programs.brave = {
    enable = true;
    nativeMessagingHosts = lib.optionals osConfig.services.desktopManager.plasma6.enable [
      pkgs.kdePackages.plasma-browser-integration
    ];
    extensions =
      [
        # Catppuccin Theme
        { id = catppuccinThemeId.${catppuccinFlavor}; }
        # Catppuccin for GitHub File Explorer Icons
        { id = "lnjaiaapbakfhlbjenjkhffcdpoompki"; }
        # Bitwarden
        { id = "nngceckbapebfimnlniiiahkandclblb"; }
        # Stylus
        { id = "clngdbkpkpeebahjckkjfobafhncgmne"; }
        # Violentmonkey
        { id = "jinjaccalgkegednnccohejagnlnfdag"; }
        # Dark Reader
        { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }
      ]
      ++ lib.optionals osConfig.services.desktopManager.plasma6.enable [
        # Plasma integration
        { id = "cimiefiiaegbelhefglklhhakcgmhkai"; }
      ];
  };
}
