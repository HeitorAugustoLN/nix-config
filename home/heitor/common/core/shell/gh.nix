{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-copilot ];
    settings.git_protocol = "ssh";
  };
}
