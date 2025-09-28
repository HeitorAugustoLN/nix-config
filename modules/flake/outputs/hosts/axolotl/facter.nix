{ inputs, ... }:
{
  axon.hosts.nixos.axolotl.nixos = {
    imports = [ inputs.nixos-facter-modules.nixosModules.facter ];
    facter.reportPath = ./facter.json;
  };
}
