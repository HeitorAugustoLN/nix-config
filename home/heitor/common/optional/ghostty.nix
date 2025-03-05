{ config, pkgs, ... }:
{
  catppuccin.ghostty.enable = true;

  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  programs.ghostty = {
    enable = true;

    enableBashIntegration = config.programs.bash.enable;
    enableFishIntegration = config.programs.fish.enable;
    enableZshIntegration = config.programs.zsh.enable;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;
      mouse-hide-while-typing = true;
      window-theme = "ghostty";
    };
  };
}
