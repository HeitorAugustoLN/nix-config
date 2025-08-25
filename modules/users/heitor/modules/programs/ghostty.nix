{
  unify.modules."heitor.ghostty".home =
    { pkgs, ... }:
    {
      catppuccin.ghostty.enable = true;
      home.packages = [ pkgs.nerd-fonts.adwaita-mono ];

      programs.ghostty = {
        enable = true;

        settings = {
          font-family = "AdwaitaMono Nerd Font";
          font-family-bold = "AdwaitaMono Nerd Font Bold";
          font-family-bold-italic = "AdwaitaMono Nerd Font Bold Italic";
          font-family-italic = "AdwaitaMono Nerd Font Italic";
          font-size = 13;
          window-theme = "ghostty";
        };
      };
    };
}
