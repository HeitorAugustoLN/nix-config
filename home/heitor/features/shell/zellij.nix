{ config, ... }:
{
  programs.zellij = {
    enable = true;
    enableFishIntegration = config.programs.fish.enable;
    catppuccin.enable = true;
  };
}
