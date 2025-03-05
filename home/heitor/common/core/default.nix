{ config, ... }:
{
  imports = [
    ./catppuccin.nix
    ./flatpak.nix
    ./neovim.nix
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
