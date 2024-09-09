{
  stdenv,
  lib,
  fetchFromGitHub,
  nix-update-script,
  kdePackages,
  ...
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "kara";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "dhruv8sh";
    repo = "kara";
    rev = "main";
    hash = "sha256-wyDomHlDMGPCaDfPggzP64YOMfx3/KF0e/YOM4wbqyQ=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/plasma/plasmoids/org.dhruv8sh.kara
    cp metadata.json $out/share/plasma/plasmoids/org.dhruv8sh.kara
    cp -r contents $out/share/plasma/plasmoids/org.dhruv8sh.kara

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "KDE Plasma Applet for use as a desktop/workspace pager";
    homepage = "https://github.com/dhruv8sh/kara";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ HeitorAugustoLN ];
    inherit (kdePackages.kwindowsystem.meta) platforms;
  };
})
