{ config, inputs, ... }:
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops.age = {
    generateKey = true;
    keyFile = "${config.xdg.configHome}/sops/keys.txt";
    sshKeyPaths = [ "${config.home.homeDirectory}/.ssh/id-ed25519-sops" ];
  };
}
