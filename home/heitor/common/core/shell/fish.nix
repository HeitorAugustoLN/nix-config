{
  catppuccin.fish.enable = true;

  programs.fish = {
    enable = true;
    preferAbbrs = true;
    functions.fish_greeting = "";

    interactiveShellInit = # fish
      ''
        fish_vi_key_bindings
      '';
  };
}
