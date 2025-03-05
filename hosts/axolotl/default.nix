{ inputs, ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix

    inputs.disko.nixosModules.disko

    inputs.nixos-hardware.nixosModules.common-cpu-intel-cpu-only
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ../common/optional/cosmic.nix
    ../common/optional/pipewire.nix
    ../common/optional/systemd-boot.nix
    ../common/users/heitor
  ];

  system.stateVersion = "24.11";
}
