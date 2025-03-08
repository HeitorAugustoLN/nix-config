{ config, lib, ... }:
let
  inherit (lib) concatStrings;
in
{
  programs.starship = {
    enable = true;
    enableTransience = config.programs.fish.enable;

    # TODO: Expand this configuration further, it is not nearly complete.
    # But it currently works just similar to typewritten, which is my objective.
    settings = {
      add_newline = false;
      format = concatStrings [ "$character" ];
      git_branch.format = "-> [$branch]($style) ";
      git_status.format = "[$all_status$ahead_behind]($style) ";

      right_format = concatStrings [
        "$directory"
        "$git_branch"
        "$git_status"
      ];
    };
  };
}
