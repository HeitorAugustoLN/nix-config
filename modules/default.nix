{ inputs, ... }:
{
  imports = [ inputs.home-manager.flakeModules.home-manager ];

  flake = {
    homeManagerModules = { };
    nixosModules = { };
  };
}
