{ lib, pkgs, ... }:
let
  inherit (lib) singleton;
in
{
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  programs.gpg = {
    enable = true;

    publicKeys = singleton {
      source = ../../../pgp.asc;
      trust = 5;
    };
  };
}
