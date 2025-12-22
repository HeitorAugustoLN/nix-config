{ config, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      addKeysToAgent = "yes";
      identityFile = "${config.home.homeDirectory}/.ssh/id-ed25519";
    };
  };

  services.ssh-agent.enable = true;
}
