{
  config,
  lib,
  pkgs,
  ...
}: let
  codeFont = config.programs.plasma.fonts.fixedWidth.family;
  textFont = config.programs.plasma.fonts.general.family;

  catppuccinAccent = config.catppuccin.accent;
  catppuccinFlavor = config.catppuccin.flavor;
in {
  programs.ghostwriter = {
    enable = true;
    locale = "pt_BR";

    font = {
      family = textFont;
      pointSize = 12;
    };

    general = {
      display = {
        hideMenubarInFullscreen = true;
        interfaceStyle = "rounded";
        showCurrentTimeInFullscreen = true;
        showUnbreakableSpace = false;
      };
      fileSaving = {
        autoSave = true;
        backupFileOnSave = true;
      };
      session = {
        openLastFileOnStartup = true;
        rememberRecentFiles = true;
      };
    };

    editor = {
      styling = {
        blockquoteStyle = "simple";
        editorWidth = "medium";
        emphasisStyle = "italic";
        focusMode = "sentence";
        useLargeHeadings = true;
      };
      tabulation = {
        insertSpacesForTabs = true;
        tabWidth = 2;
      };
      typing = {
        automaticallyMatchCharacters = {
          enable = true;
          characters = ''\"'([{*_`<'';
        };
        bulletPointCycling = true;
      };
    };

    preview = {
      codeFont = {
        family = codeFont;
        pointSize = 12;
      };
      markdownVariant = "cmark-gfm";
      openByDefault = true;
      textFont = {
        family = textFont;
        pointSize = 12;
      };
    };

    spelling = {
      autoDetectLanguage = true;
      checkerEnabledByDefault = true;
      ignoreUppercase =false;
      ignoredWords = [
        "Amarok"
        "KAddressBook"
        "KDevelop"
        "KHTML"
        "KIO"
        "KJS"
        "KMail"
        "KMix"
        "KOrganizer"
        "Konqueror"
        "Kontact"
        "Nepomuk"
        "Okular"
        "Qt"
        "Sonnet"
      ];
    };

    theme = {
      customThemes = {
        Catppuccin = let
          theme = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "ghostwriter";
            rev = "84830fbd4bff8805ccf91ea35cbd9d8b717a3c43";
            hash = "sha256-0Laz7n7SEzK42AVlVpRBX3luIXfASBM4wfQlSnkuGZE=";
          };
          capitalizeWord = word: let
            firstLetter = builtins.substring 0 1 word;
            rest = builtins.substring 1 (builtins.stringLength word - 1) word;
          in "${lib.toUpper firstLetter}${rest}";
        in "${theme}/colours/Catppuccin-Latte-${capitalizeWord catppuccinFlavor}-${capitalizeWord catppuccinAccent}.json";
      };
      name = "Catppuccin";
    };
  };
}
