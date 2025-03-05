{ inputs, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops.age = {
    generateKey = true;
    keyFile = "/var/lib/sops-nix/keys.txt";
    sshKeyPaths = [ "/etc/ssh/host-ed25519-sops" ];
  };
}
