{
  umu-run,
  buildFHSEnv,
  writeShellScript,
  lib,
}:
buildFHSEnv {
  name = "umu-run";
  buildInputs = [ umu-run ];
  runScript = writeShellScript "umu-run-shell" ''
    ${lib.getExe umu-run} "$@"
  '';
}
