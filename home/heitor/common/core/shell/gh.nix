{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-copilot ];

    settings = {
      editor = "nvim";
      git_protocol = "ssh";
    };
  };
}
