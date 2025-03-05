{ cosmicLib, ... }:
let
  inherit (cosmicLib.cosmic) mkRon;
in
{
  wayland.desktopManager.cosmic.panels = [
    {
      anchor = mkRon "enum" "Top";
      anchor_gap = true;
      autohide = mkRon "optional" null;
      background = mkRon "enum" "ThemeDefault";
      expand_to_edges = true;
      name = "Panel";
      opacity = 1.0;
      output = mkRon "enum" "All";
      plugins_center = mkRon "optional" [ "com.system76.CosmicAppletTime" ];

      plugins_wings = mkRon "optional" (
        mkRon "tuple" [
          [ "com.system76.CosmicAppletWorkspaces" ]
          [
            "com.system76.CosmicAppletInputSources"
            "com.system76.CosmicAppletStatusArea"
            "com.system76.CosmicAppletTiling"
            "com.system76.CosmicAppletAudio"
            "com.system76.CosmicAppletNetwork"
            "com.system76.CosmicAppletNotifications"
            "com.system76.CosmicAppletPower"
          ]
        ]
      );

      size = mkRon "enum" "XS";
    }
    {
      anchor = mkRon "enum" "Bottom";
      anchor_gap = true;
      autohide = mkRon "optional" null;
      background = mkRon "enum" "ThemeDefault";
      expand_to_edges = false;
      name = "Dock";
      opacity = 1.0;
      output = mkRon "enum" "All";

      plugins_center = mkRon "optional" [
        "com.system76.CosmicPanelLauncherButton"
        "com.system76.CosmicPanelWorkspacesButton"
        "com.system76.CosmicPanelAppButton"
        "com.system76.CosmicAppList"
        "com.system76.CosmicAppletMinimize"
      ];

      plugins_wings = mkRon "optional" null;
      size = mkRon "enum" "L";
    }
  ];
}
