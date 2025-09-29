{
  axon =
    let
      home-manager = {
        backupFileExtension = "bak";
        useGlobalPkgs = true;
        useUserPackages = true;
        verbose = true;
      };
    in
    {
      nixos = { inherit home-manager; };
      darwin = { inherit home-manager; };
    };
}
