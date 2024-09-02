{
  config,
  lib,
  pkgs,
  ...
}:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users = {
    mutableUsers = false;
    users.heitor = {
      description = "Heitor Augusto";
      group = "users";
      extraGroups = ifTheyExist [
        "networkmanager"
        "wheel"
      ];
      hashedPasswordFile = config.sops.secrets.heitor-password.path;
      isNormalUser = true;
      shell = pkgs.fish;
    };
  };

  sops.secrets.heitor-password = {
    sopsFile = ../../secrets.yaml;
    neededForUsers = true;
  };

  home-manager.users.heitor = import ../../../../home/heitor/${config.networking.hostName}.nix;
}
