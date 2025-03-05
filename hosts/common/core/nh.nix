{ config, ... }:
{
  programs.nh = {
    enable = true;
    flake = "${config.users.users.heitor.home}/Projects/nix-config";

    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 7d";
    };
  };
}
