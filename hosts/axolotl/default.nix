{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./disk-configuration.nix
    # ./hardware-configuration.nix
    ../common/users/heitor
    inputs.disko.nixosModules.disko
    inputs.nixos-facter-modules.nixosModules.facter
  ];

  networking.firewall.checkReversePath = false;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  i18n.inputMethod.enable = true;
  i18n.inputMethod.type = "ibus";

  facter.reportPath = ./facter.json;
  facter.detected.dhcp.enable = false;

  environment.systemPackages = [
    (pkgs.kdePackages.kdenlive.overrideAttrs (oldAttrs: {
      qtWrapperArgs = oldAttrs.qtWrapperArgs ++ [
        "--prefix PATH : ${
          lib.makeBinPath [
            (pkgs.python3.withPackages (
              ps: with ps; [
                opencv4
                requests
                numpy
                openai-whisper
                torch
                srt
                (pkgs.callPackage (
                  {
                    lib,
                    python3Packages,
                    fetchPypi,
                  }:
                  python3Packages.buildPythonPackage rec {
                    pname = "sam2";
                    version = "1.1.0";
                    pyproject = true;

                    src = fetchPypi {
                      inherit pname version;
                      hash = "sha256-fg6iUtQ8ENhT46z84LV3CsaDwwSBvW3jETAOnUT0W3Q=";
                    };

                    build-system = [
                      setuptools
                      torch
                    ];

                    pythonImportsCheck = [ "sam2" ];

                    dependencies = [
                      hydra-core
                      iopath
                      numpy
                      pillow
                      torch
                      torchvision
                      tqdm
                    ];

                    meta = {
                      description = "SAM 2: Segment Anything in Images and Videos";
                      homepage = "http://pypi.org/project/sam2";
                      license = with lib.licenses; [
                        bsd3
                        asl20
                      ];
                      maintainers = with lib.maintainers; [ HeitorAugustoLN ];
                      platforms = lib.platforms.all;
                    };
                  }
                ) { })
              ]
            ))
          ]
        }"
        "--suffix XDG_DATA_DIRS : ${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
      ];
    }))
  ];

  xdg.terminal-exec = {
    enable = true;
    settings.default = [ "ghostty.desktop" ];
  };

  system.stateVersion = "25.11";
}
