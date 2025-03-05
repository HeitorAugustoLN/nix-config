{ config, lib, ... }:
let
  inherit (builtins) mapAttrs;
  inherit (lib) mkForce;
in
{
  xdg = {
    enable = true;

    userDirs =
      {
        enable = true;
        createDirectories = true;
      }
      // mapAttrs (_: value: mkForce "${config.home.homeDirectory}/${value}") {
        desktop = "Desktop";
        documents = "Documents";
        download = "Downloads";
        music = "Music";
        pictures = "Pictures";
        publicShare = "Public";
        templates = "Templates";
        videos = "Videos";
      };
  };
}
