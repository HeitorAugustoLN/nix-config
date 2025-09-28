{
  description = "HeitorAugustoLN's personal Nix configuration flake.";

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  nixConfig = {
    extra-experimental-features = [ "pipe-operators" ];

    extra-substituters = [
      "https://heitor.cachix.org"
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "heitor.cachix.org-1:IZ1ydLh73kFtdv+KfcsR4WGPkn+/I926nTGhk9O9AxI="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    axon = {
      type = "github";
      owner = "HeitorAugustoLN";
      repo = "axon";
      ref = "init";

      inputs = {
        flake-parts.follows = "flake-parts";
        home-manager.follows = "home-manager";
        import-tree.follows = "import-tree";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    arkenfox-nix = {
      type = "github";
      owner = "HeitorAugustoLN";
      repo = "arkenfox-nix";
      ref = "init";

      inputs = {
        flake-parts.follows = "flake-parts";
        import-tree.follows = "import-tree";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    catppuccin = {
      type = "github";
      owner = "catppuccin";
      repo = "nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      type = "github";
      owner = "nix-community";
      repo = "disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-compat = {
      type = "github";
      owner = "edolstra";
      repo = "flake-compat";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    git-hooks = {
      type = "github";
      owner = "cachix";
      repo = "git-hooks.nix";

      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    import-tree = {
      type = "github";
      owner = "vic";
      repo = "import-tree";
    };

    nixos-facter-modules = {
      type = "github";
      owner = "nix-community";
      repo = "nixos-facter-modules";
    };

    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    nur = {
      type = "github";
      owner = "nix-community";
      repo = "NUR";

      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    sops-nix = {
      type = "github";
      owner = "Mic92";
      repo = "sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    systems = {
      type = "github";
      owner = "nix-systems";
      repo = "default-linux";
    };

    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
