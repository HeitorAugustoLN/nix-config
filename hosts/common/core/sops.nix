{ config, inputs, ... }:
let
  inherit (builtins) filter;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops.age = {
    generateKey = true;
    keyFile = "/var/lib/sops-nix/keys.txt";
    sshKeyPaths =
      config.services.openssh.hostKeys |> filter (key: key.type == "ed25519") |> map (key: key.path);
  };
}
