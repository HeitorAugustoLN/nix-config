{
  programs.fish = {
    enable = true;
    catppuccin.enable = true;
    preferAbbrs = true;

    functions = {
      fish_greeting = ""; # Disable fish greeting
    };

    interactiveShellInit = # fish
      ''
        # Use vim bindings and cursors
        fish_vi_key_bindings
        set fish_cursor_default     block      blink
        set fish_cursor_insert      line       blink
        set fish_cursor_replace_one underscore blink
        set fish_cursor_visual      block
      '';
  };
}
