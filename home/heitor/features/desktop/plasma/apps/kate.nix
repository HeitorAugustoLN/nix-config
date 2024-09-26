{ config, lib, ... }:
let
  fontFamily = config.programs.plasma.fonts.fixedWidth.family;
  catppuccinFlavor = config.catppuccin.flavor;

  capitalizeWord =
    word:
    let
      firstLetter = builtins.substring 0 1 word;
      rest = builtins.substring 1 (builtins.stringLength word - 1) word;
    in
    "${lib.toUpper firstLetter}${rest}";
in
{
  programs.kate = {
    enable = true;
    editor = {
      brackets = {
        automaticallyAddClosing = true;
        characters = "<>(){}[]'\"`";
        flashMatching = false;
        highlightMatching = true;
        highlightRangeBetween = false;
      };
      font = {
        family = fontFamily;
        pointSize = 14;
      };
      indent = {
        autodetect = true;
        backspaceDecreaseIndent = true;
        keepExtraSpaces = false;
        replaceWithSpaces = true;
        showLines = true;
        tabFromEverywhere = false;
        undoByShiftTab = true;
        width = 2;
      };
      inputMode = "vi";
      tabWidth = 2;
      theme.name = "Catppuccin ${capitalizeWord catppuccinFlavor}";
    };
  };
}
