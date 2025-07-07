{ config, ... }:
{
  imports = [
    ./zen.nix
    ./catppuccin.nix
    ./cosmic
    ./flatpak.nix
    ./ghostty.nix
    ./mpv.nix
    ./shell
    ./sops.nix
    ./ssh.nix
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

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
