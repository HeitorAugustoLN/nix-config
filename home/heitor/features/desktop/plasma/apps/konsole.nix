{
  config,
  pkgs,
  ...
}: let
  catppuccinFlavor = config.catppuccin.flavor;
in {
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode"];})
  ];

  programs.konsole = {
    enable = true;
    customColorSchemes = {
      Catppuccin = let
        theme = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "konsole";
          rev = "3b64040e3f4ae5afb2347e7be8a38bc3cd8c73a8";
          hash = "sha256-d5+ygDrNl2qBxZ5Cn4U7d836+ZHz77m6/yxTIANd9BU=";
        };
      in "${theme}/themes/catppuccin-${catppuccinFlavor}.colorscheme";
    };
    defaultProfile = "Heitor";

    profiles = {
      Heitor = {
        colorScheme = "Catppuccin";
        font = {
          name = "FiraCode Nerd Font";
          size = 12;
        };
      };
    };
  };
}
