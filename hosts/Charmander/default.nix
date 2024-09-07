{
  config,
  inputs,
  ...
}:
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

    ../common/optional/kernel/latest.nix

    ../common/optional/desktop/plasma6.nix

    ../common/optional/services/networkmanager.nix
    ../common/optional/services/pipewire.nix
    ../common/optional/services/plymouth.nix

    ../common/optional/gaming/gamescope.nix
    ../common/optional/gaming/steam.nix

    ../common/optional/piper.nix
    ../common/optional/stevenblack.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/virt-manager.nix
  ];

  networking.hostName = "Charmander";

  users.users.root.hashedPasswordFile = config.sops.secrets.heitor-password.path;

  system.stateVersion = "24.11";
}
