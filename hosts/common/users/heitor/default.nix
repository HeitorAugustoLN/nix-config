{
  config,
  lib,
  pkgs,
  self,
  ...
}:
let
  inherit (builtins) attrValues filter hasAttr;
  inherit (lib) mkDefault;
in
{
  home-manager.users.heitor.imports = [
    ../../../../home/heitor/${config.networking.hostName}
    ../../../../home/heitor/common/core
  ]
  ++ attrValues self.homeManagerModules;

  sops.secrets."heitor/password" = {
    neededForUsers = true;
    sopsFile = ../../../../secrets/hosts/common/default.yaml;
  };

  systemd.tmpfiles.rules = [
    "L+ /var/lib/AccountsService/icons/heitor - - - - ${./icon.jpg}"
  ];

  users = {
    mutableUsers = false;

    users = {
      heitor = {
        description = "Heitor Augusto";

        extraGroups = filter (group: hasAttr group config.users.groups) [
          "networkmanager"
          "wheel"
        ];

        group = "users";
        hashedPasswordFile = config.sops.secrets."heitor/password".path;
        isNormalUser = true;
        shell = pkgs.nushell;
      };

      root.hashedPasswordFile = mkDefault config.sops.secrets."heitor/password".path;
    };
  };
}
