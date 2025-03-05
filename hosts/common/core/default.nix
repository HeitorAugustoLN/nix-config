{
  inputs,
  inputs',
  lib,
  pkgs,
  self,
  self',
  ...
}:
let
  inherit (lib) mkDefault mkForce;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./catppuccin.nix
    ./console.nix
    ./fish.nix
    ./flatpak.nix
    ./locale.nix
    ./nh.nix
    ./nix.nix
    ./nix-ld.nix
    ./openssh.nix
    ./security.nix
    ./sops.nix
    ./stevenblack.nix
    ./xdg.nix
    ./zram.nix
  ];

  boot = {
    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  documentation = {
    # Whether to install documentation of packages from environment.systemPackages into the generated system path. See "Multiple-output packages" chapter in the nixpkgs manual for more info.
    enable = mkDefault true;
    # Whether to install manual pages and the man command. This also includes "man" outputs.
    man.enable = mkDefault true;
    # Whether to install documentation distributed in packages' /share/doc. Usually plain text and/or HTML. This also includes "doc" outputs.
    doc.enable = mkForce false;
    # Installs man and doc pages if they are enabled
    # Takes too much time and are not cached
    nixos.enable = mkForce false;
    # Whether to install info pages and the info command. This also includes "info" outputs.
    info.enable = mkForce false;
  };

  home-manager = {
    backupFileExtension = "old";

    extraSpecialArgs = {
      inherit
        inputs
        inputs'
        self
        self'
        ;
    };

    useGlobalPkgs = true;
    useUserPackages = true;
    verbose = true;
  };

  programs.command-not-found.enable = false;
}
