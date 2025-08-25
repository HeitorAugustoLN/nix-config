{ inputs, ... }:
{
  unify.modules.facter.nixos.imports = [ inputs.nixos-facter-modules.nixosModules.facter ];
}
