{ cosmicLib, ... }:
let
  inherit (cosmicLib.cosmic) mkRON;
in
{
  wayland.desktopManager.cosmic.panels = [
    {
      anchor = mkRON "enum" "Top";
      anchor_gap = true;
      autohide = mkRON "optional" null;
      background = mkRON "enum" "ThemeDefault";
      expand_to_edges = true;
      name = "Panel";
      opacity = 1.0;
      output = mkRON "enum" "All";
      margin = 4;
      plugins_center = mkRON "optional" [ "com.system76.CosmicAppletTime" ];

      plugins_wings = mkRON "optional" (
        mkRON "tuple" [
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

      size = mkRON "enum" "XS";
    }
    {
      anchor = mkRON "enum" "Bottom";
      anchor_gap = true;
      autohide = mkRON "optional" null;
      background = mkRON "enum" "ThemeDefault";
      expand_to_edges = false;
      margin = 4;
      name = "Dock";
      opacity = 1.0;
      output = mkRON "enum" "All";

      plugins_center = mkRON "optional" [
        "com.system76.CosmicPanelLauncherButton"
        "com.system76.CosmicPanelWorkspacesButton"
        "com.system76.CosmicPanelAppButton"
        "com.system76.CosmicAppList"
        "com.system76.CosmicAppletMinimize"
      ];

      plugins_wings = mkRON "optional" null;
      size = mkRON "enum" "L";
    }
  ];
}
