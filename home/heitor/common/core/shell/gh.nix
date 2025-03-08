{ config, pkgs, ... }:
{
  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-copilot ];

    settings = {
      editor = config.home.sessionVariables.EDITOR;
      git_protocol = "ssh";
    };
  };
}
