{ inputs, ... }:
{
  unify.modules.disko.nixos.imports = [ inputs.disko.nixosModules.disko ];
}
