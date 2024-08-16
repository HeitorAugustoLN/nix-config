{
  description = "HeitorAugustoLN's personal Nix configuration flake.";

  inputs = {
    # Flake framework
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Declarative disk partitioning
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Collection of hardware configurations
    hardware.url = "github:nixos/nixos-hardware";

    # Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nur.url = "github:nix-community/NUR"; # Nix User Repository: User contributed nix packages

    # User-specific configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secrets management
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    # System and user theme
    catppuccin.url = "github:catppuccin/nix";

    # KDE Plasma and KDE apps configuration
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    # Firefox user.js
    betterfox = {
      url = "github:HeitorAugustoLN/betterfox-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        ./hosts
        ./modules
        ./overlays
        ./pkgs
      ];

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
      };
    };
}
