{ pkgs, ... }:
{
  catppuccin.ghostty.enable = true;

  home.packages = [
    pkgs.nerd-fonts.geist-mono
    pkgs.protonvpn-gui
  ];

  programs.ghostty = {
    enable = true;

    settings = {
      font-family = "GeistMono Nerd Font";
      font-size = 13;
      mouse-hide-while-typing = true;
      window-theme = "ghostty";
    };
  };
}
