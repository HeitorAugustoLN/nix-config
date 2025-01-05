{
  description = "HeitorAugustoLN's personal Nix configuration flake";

  inputs = {
    # Flake framework
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # Declarative disk partitioning
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Collection of hardware configurations
    hardware.url = "github:nixos/nixos-hardware";

    # Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nur.url = "github:nix-community/NUR"; # Nix User Repository: User contributed nix packages

    # User-specific configuration
    home-manager = {
      url = "github:HeitorAugustoLN/home-manager/chromium-nativemessaginghosts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secrets management
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # System and user theme
    catppuccin.url = "github:catppuccin/nix";
    catppuccin-palette = {
      url = "github:HeitorAugustoLN/palette/flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-where-is-my-sddm-theme = {
      url = "github:catppuccin/where-is-my-sddm-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    # Neovim
    neovim = {
      url = "github:HeitorAugustoLN/nvim-config";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    # Wallpapers collection that I use
    wallpapers = {
      url = "github:HeitorAugustoLN/wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        ./hosts
        ./modules
        ./overlays
        ./pkgs

        ./flake/configurations.nix
      ];

      perSystem =
        { pkgs, ... }:
        {
          devShells = import ./shell.nix { inherit pkgs; };
          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
