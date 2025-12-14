{ pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };

  programs.gpg = {
    enable = true;

    publicKeys = [
      {
        source = ../../../pgp.asc;
        trust = 5;
      }
    ];
  };
}
