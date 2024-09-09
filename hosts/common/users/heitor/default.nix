{ config, pkgs, ... }:
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
      openssh.authorizedKeys.keys = [
        # Venusaur SSH Key
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAWo7o4Y5yRnFf5tyqEpWHB+GLqRx9dyNoyY7i5XOn+t IAm.HeitorALN@proton.me"
      ];
      shell = pkgs.fish;
    };
  };

  sops.secrets.heitor-password = {
    sopsFile = ../../secrets.yaml;
    neededForUsers = true;
  };

  home-manager.users.heitor = import ../../../../home/heitor/${config.networking.hostName}.nix;
}
