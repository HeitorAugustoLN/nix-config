{ config, inputs, ... }:
{
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel-cpu-only
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc
    inputs.hardware.nixosModules.common-pc-ssd

    inputs.disko.nixosModules.disko # Needed for disk configuration
    ./disk-configuration.nix
    ./hardware-configuration.nix

    ../common/global
    ../common/users/heitor

    ../common/optional/bootloader/systemd-boot.nix
    ../common/optional/desktop/plasma.nix

    ../common/optional/gaming/gamescope.nix
    ../common/optional/gaming/steam.nix

    ../common/optional/kernel/latest.nix

    ../common/optional/services/networkmanager.nix
    ../common/optional/services/pipewire.nix
    ../common/optional/services/plymouth.nix

    ../common/optional/virtualisation/virt-manager.nix
    ../common/optional/virtualisation/waydroid.nix

    ../common/optional/piper.nix
    ../common/optional/stevenblack.nix
  ];

  networking.hostName = "Charmander";

  users.users.root.hashedPasswordFile = config.sops.secrets.heitor-password.path;

  system.stateVersion = "24.11";
}
