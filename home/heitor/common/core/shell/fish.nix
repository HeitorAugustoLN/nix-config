{ pkgs, ... }:
{
  catppuccin.fish.enable = true;

  programs.fish = {
    enable = true;
    preferAbbrs = true;
    functions.fish_greeting = "";

    interactiveShellInit = # fish
      ''
        # Use helix bindings
        fish_vi_key_bindings
        fish_helix_key_bindings
      '';

    plugins = [
      {
        name = "fish-helix";

        src = pkgs.fetchFromGitHub {
          owner = "sshilovsky";
          repo = "fish-helix";
          rev = "8a5c7999ec67ae6d70de11334aa888734b3af8d7";
          hash = "sha256-04cL9/m5v0/5dkqz0tEqurOY+5sDjCB5mMKvqgpV4vM=";
        };
      }
    ];
  };
}
