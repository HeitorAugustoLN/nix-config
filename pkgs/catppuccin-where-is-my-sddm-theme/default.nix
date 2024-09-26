{
  lib,
  fetchFromGitHub,
  where-is-my-sddm-theme,
  nix-update-script,
  flavor ? "mocha",
  variants ? [ "qt6" ],
}:
let
  theme = fetchFromGitHub {
    owner = "HeitorAugustoLN";
    repo = "catppuccin-where-is-my-sddm-theme";
    rev = "main";
    hash = "sha256-iPiExjO+1euylC3HvPPKLfcuKBwcUqSGyomfYzxS9Yg=";
  };
  validVariants = [
    "qt5"
    "qt6"
  ];
in
lib.checkListOfEnum "catppuccin-where-is-my-sddm-theme: variant" validVariants variants
  (where-is-my-sddm-theme.override { inherit variants; }).overrideAttrs
  (oldAttrs: {
    pname = "catppuccin-where-is-my-sddm-theme";
    version = "1.0.0";

    installPhase =
      oldAttrs.installPhase
      + lib.optionalString (lib.elem "qt6" variants) ''
        ln -sf ${theme}/themes/catppuccin-${flavor}.conf $out/share/sddm/themes/where_is_my_sddm_theme/theme.conf.user
      ''
      + lib.optionalString (lib.elem "qt5" variants) ''
        ln -sf ${theme}/themes/catppuccin-${flavor}.conf $out/share/sddm/themes/where_is_my_sddm_theme_qt5/theme.conf.user
      '';

    passthru.updateScript = nix-update-script { };

    meta = {
      description = "Soothing pastel theme for Where is my SDDM theme?";
      homepage = "https://github.com/HeitorAugustoLN/catppuccin-where-is-my-sddm-theme";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ HeitorAugustoLN ];
      inherit (oldAttrs.meta) platforms;
    };
  })
