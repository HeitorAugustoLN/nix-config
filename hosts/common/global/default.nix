{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./catppuccin.nix
    ./console.nix
    ./fish.nix
    ./gamemode.nix
    ./kdeconnect.nix
    ./locale.nix
    ./nh.nix
    ./nix.nix
    ./nix-ld.nix
    ./openssh.nix
    ./security.nix
    ./sops.nix
    ./sudo.nix
  ] ++ builtins.attrValues inputs.self.nixosModules;

  boot.initrd.systemd.enable = true;

  home-manager = {
    backupFileExtension = "old";
    extraSpecialArgs = {
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
