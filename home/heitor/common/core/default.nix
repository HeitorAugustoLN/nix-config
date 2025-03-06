{ config, ... }:
{
  imports = [
    ./brave.nix
    ./catppuccin.nix
    ./cosmic
    ./flatpak.nix
    ./ghostty.nix
    ./mpv.nix
    ./shell
    ./sops.nix
    ./xdg.nix
  ];

  home = {
    username = "heitor";
    homeDirectory = "/home/${config.home.username}";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  systemd.user.startServices = "sd-switch";
}
