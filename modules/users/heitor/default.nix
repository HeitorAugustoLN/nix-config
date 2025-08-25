let
  username = "heitor";
in
{
  unify.modules.heitor = {
    nixos =
      { config, pkgs, ... }:
      {
        sops.secrets."heitor/password" = {
          neededForUsers = true;
          sopsFile = ../../../secrets/hosts/common/default.yaml;
        };

        users = {
          mutableUsers = false;

          users.${username} = {
            description = "Heitor Augusto";
            extraGroups = [
              "networkmanager"
              "wheel"
            ];
            group = "users";
            hashedPasswordFile = config.sops.secrets."heitor/password".path;
            isNormalUser = true;
            shell = pkgs.nushell;
          };
        };
      };

    home.home = {
      homeDirectory = "/home/${username}";
      inherit username;
    };
  };
}
