{
  umu-run,
  umu-run-fhs,
  symlinkJoin,
}:
symlinkJoin {
  name = "umu-run-wrapped";
  paths = [
    umu-run
    umu-run-fhs
  ];
  postBuild = ''
    rm $out/bin/umu
  '';
}
