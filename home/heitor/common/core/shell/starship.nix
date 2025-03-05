{ config, ... }:
{
  programs.starship = {
    enable = true;
    enableTransience = config.programs.fish.enable;
  };
}
