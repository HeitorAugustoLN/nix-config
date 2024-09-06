{
  config,
  pkgs,
  ...
}:
let
  catppuccinFlavor = config.catppuccin.flavor;
in
{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  programs.konsole = {
    enable = true;
    catppuccin.enable = true;
    defaultProfile = "Heitor";

    profiles = {
      Heitor = {
        colorScheme = "catppuccin-${catppuccinFlavor}";
        font = {
          name = "FiraCode Nerd Font";
          size = 12;
        };
      };
    };
  };
}
