{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    localNetworkGameTransfers.openFirewall = true;
    protontricks.enable = true;
    remotePlay.openFirewall = true;
  };
}
