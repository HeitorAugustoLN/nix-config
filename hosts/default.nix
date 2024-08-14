{inputs, ...}: {
  flake.nixosConfigurations = {
    Charmander = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [./Charmander];
    };
  };
}
