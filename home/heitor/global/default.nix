{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    ./catppuccin.nix
  ] ++ (builtins.attrValues inputs.self.homeManagerModules);

  home = {
    username = lib.mkDefault "heitor";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
  };

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
