{ inputs, ... }:
{
  flake.overlays = {
    # My custom packages
    additions = final: _prev: import ../pkgs/all-packages.nix { pkgs = final; };

    modifications = final: prev: {
      # TODO: Remove this when v0.7.1 gets in upstream nixpkgs
      application-title-bar = prev.application-title-bar.overrideAttrs {
        version = "0.7.1";
        src = prev.fetchFromGitHub {
          owner = "antroids";
          repo = "application-title-bar";
          rev = "v0.7.1";
          hash = "sha256-rsbMHh8T3ZLB0u+jccD48EaXKxaGI32uA9KVfkD4GMU=";
        };
      };
      # Catppuccin theme for SDDM with Where is my sddm theme
      where-is-my-sddm-theme = prev.where-is-my-sddm-theme.override {
        themeConfig.General = {
          background = "";
          backgroundFill = "#1e1e2e";
          backgroundFillMode = "aspect";
          basicTextColor = "#cdd6f4";
          blurRadius = 0;
          cursorBlinkAnimation = true;
          hideCursor = true;
          passwordAllowEmpty = false;
          passwordCharacter = "*";
          passwordCursorColor = "#cdd6f4";
          passwordFontSize = 32;
          passwordInputBackground = "#313244";
          passwordInputCursorVisible = true;
          passwordInputRadius = 10;
          passwordInputWidth = 0.5;
          passwordMask = true;
          passwordTextColor = "#cdd6f4";
          sessionsFontSize = 24;
          showUserRealNameByDefault = true;
          showSessionsByDefault = true;
          showUsersByDefault = true;
          usersFontSize = 32;
        };
      };
    };

    # Acessible through 'pkgs.nur'
    nur-packages = _final: prev: {
      nur = import inputs.nur {
        nurpkgs = prev;
        pkgs = prev;
      };
    };

    # Acessible through 'pkgs.stable'
    stable-packages = final: _prev: {
      stable = import inputs.nixpkgs-stable {
        system = final.system;
        config.allowUnfree = true;
      };
    };
  };
}
