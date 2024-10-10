{
  lib,
  buildGoModule,
  fetchFromGitHub,
  fetchurl,
  pkg-config,
  xorg,
  wayland,
  vulkan-headers,
  wine64Packages,
  libGL,
  libxkbcommon,
  makeBinaryWrapper,
}:
let
  wine = (wine64Packages.staging.override { embedInstallers = true; }).overrideAttrs (oldAttrs: {
    patches = oldAttrs.patches or [ ] ++ [
      (fetchurl {
        name = "loader-prefer-winedllpath.patch";
        url = "https://raw.githubusercontent.com/flathub/org.vinegarhq.Vinegar/3e07606350d803fa386eb4c358836a230819380d/patches/wine/loader-prefer-winedllpath.patch";
        hash = "sha256-89wnr2rIbyw490hHwckB9g1GKCXm6BERnplfwEUlNOg=";
      })
    ];
  });
in
buildGoModule rec {
  pname = "vinegar";
  version = "1.7.7";

  src = fetchFromGitHub {
    owner = "vinegarhq";
    repo = "vinegar";
    rev = "v${version}";
    hash = "sha256-KFLQsSymx0RitD+dVwueIhlq5LcFEfPRiVoie7RDXbU=";
  };

  vendorHash = "sha256-LW1orfiqNkN+hw3fOBGwyAs+03L4BkEJE2z9YtJLzv0=";

  nativeBuildInputs = [
    pkg-config
    makeBinaryWrapper
  ];

  buildInputs = [
    xorg.libX11
    xorg.libXcursor
    xorg.libXfixes
    wayland
    vulkan-headers
    wine
    libGL
    libxkbcommon
  ];

  ldflags = [
    "-s"
    "-w"
  ];

  buildPhase = ''
    runHook preBuild
    make PREFIX=$out
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    make PREFIX=$out install
    runHook postInstall
  '';

  postInstall = ''
    wrapProgram $out/bin/vinegar \
      --prefix PATH : ${lib.makeBinPath [ wine ]}
  '';

  meta = {
    description = "Open-source, minimal, configurable, fast bootstrapper for running Roblox on Linux";
    homepage = "https://github.com/vinegarhq/vinegar";
    changelog = "https://github.com/vinegarhq/vinegar/releases/tag/v${version}";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ HeitorAugustoLN ];
    mainProgram = "vinegar";
    platforms = [ "x86_64-linux" ];
  };
}
