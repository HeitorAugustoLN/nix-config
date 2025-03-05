{ lib, ... }:
let
  inherit (lib) mkDefault;
in
{
  boot = {
    # Fix a security hole in place for backwards compatibility. See desc in
    # nixpkgs/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix
    loader.systemd-boot.editor = mkDefault false;
    tmp.cleanOnBoot = true;
  };

  security = {
    protectKernelImage = true;

    sudo.extraConfig = ''
      Defaults pwfeedback
    '';
  };
}
