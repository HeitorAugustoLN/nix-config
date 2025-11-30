{ config, pkgs, ... }:
{
  catppuccin.ghostty.enable = true;

  home.packages = [
    pkgs.nerd-fonts.commit-mono
    pkgs.protonvpn-gui
  ];

  programs = {
    ghostty = {
      enable = true;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableZshIntegration = config.programs.zsh.enable;

      settings = {
        font-family = "CommitMono Nerd Font";
        font-size = 13;
        mouse-hide-while-typing = true;
        window-theme = "ghostty";
      };
    };
  };
}
