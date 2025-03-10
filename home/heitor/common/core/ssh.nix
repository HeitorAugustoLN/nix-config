{ config, ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks."*".identityFile = "${config.home.homeDirectory}/.ssh/id-ed25519";
  };

  services.ssh-agent.enable = true;
}
