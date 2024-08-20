{
  config,
  inputs,
  lib,
  ...
}: let
  hosts = builtins.attrNames inputs.self.nixosConfigurations;
in {
  services.openssh = {
    enable = true;
    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
    ports = [1337];

    settings = {
      # Harden
      PasswordAuthentication = false;
      PermitRootLogin = "no";

      StreamLocalBindUnlink = "yes"; # Automatically remove stale sockets
    };
  };

  programs.ssh = {
    # Each hosts public key
    knownHosts = lib.genAttrs hosts (hostname: {
      publicKeyFile = ../../${hostname}/ssh_host_ed25519_key.pub;
      extraHostNames =
        []
        # Alias for localhost if it's the same host
        ++ (lib.optional (hostname == config.networking.hostName) "localhost");
    });
    startAgent = true;
  };
}
