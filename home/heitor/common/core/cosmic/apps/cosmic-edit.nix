{ cosmicLib, ... }:
let
  inherit (cosmicLib.cosmic) mkRON;
in
{
  programs.cosmic-edit = {
    enable = true;

    settings = {
      app_theme = mkRON "enum" "System";
      auto_indent = true;
      find_case_sensitive = false;
      find_use_regex = false;
      find_wrap_around = true;
      font_name = "JetBrains Mono";
      font_size = 14;
      highlight_current_line = true;
      line_numbers = true;
      tab_width = 2;
      vim_bindings = true;
      word_wrap = true;
    };
  };
}
