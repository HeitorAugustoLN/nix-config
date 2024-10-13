{
  lib,
  python3,
  fetchFromGitHub,
  bash,
  scdoc,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "umu-launcher";
  version = "1.1.2";
  pyproject = false;

  src = fetchFromGitHub {
    owner = "Open-Wine-Components";
    repo = "umu-launcher";
    rev = version;
    hash = "sha256-19jHWYjw1LvCcNvBgh5H419N1HY8GgA0N9aB0trE44E=";
    fetchSubmodules = true;
  };

  build-system = with python3.pkgs; [
    build
    hatchling
    installer
  ];

  nativeBuildInputs = [
    scdoc
  ];

  patches = [
    ./env_instead_of_git.patch
  ];

  dependencies = with python3.pkgs; [
    filelock
    xlib
  ];

  configureScript = "./configure.sh";
  configureFlags = [ "--prefix=${placeholder "out"}" ];
  # setOutputFlags = false;

  makeFlags = [
    "DESTDIR=${placeholder "out"}"
    "PYTHON_INTERPRETER=${lib.getExe python3}"
    "SHELL_INTERPRETER=${lib.getExe bash}"
  ];

  postInstall = ''
    mv -fv $out${python3}/* $out
    mv -fv $out$out/* $out
    rm -vrf $out/nix
    mv $out/bin/umu-run $out/bin/umu
  '';

  env = {
    UMU_VERSION = version;
  };

  # pythonImportsCheck = [
  #   "umu_launcher"
  # ];

  meta = {
    description = "";
    homepage = "https://github.com/Open-Wine-Components/umu-launcher";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "umu";
  };
}
