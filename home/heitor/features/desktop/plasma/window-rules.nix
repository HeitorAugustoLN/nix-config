{ config, ... }:
let
  desktops = config.programs.plasma.configFile."kwinrc".Desktops;
in
{
  programs.plasma.configFile."kwinrc".Desktops = {
    Id_1 = "8cc7e7ed-f92f-40c2-9ae2-a4aa20b39960";
    Id_2 = "e8a80b8e-4c14-4d40-a7b3-eec945a0def2";
    Id_3 = "7d42e2b0-8214-451c-bc3f-aedf0d595f2b";
    Id_4 = "2ef3340f-66ca-4068-8042-1cf341012f86";
    Id_5 = "6e129006-2481-4938-bb1d-740960e5c749";
    Id_6 = "8066d63c-065d-429a-a069-537521b96fb7";
    Id_7 = "8b20de0f-d7ad-498e-800a-09fc4c54eebf";
    Id_8 = "364c2cfd-e6f8-4a80-90d5-efc49a4e73d6";
    Id_9 = "178c243b-9d62-4f74-aa81-5499e929483d";
    Id_10 = "672c6445-3bba-4133-b556-66814b585e65";
  };

  programs.plasma.window-rules = [
    {
      apply = {
        desktops = {
          apply = "initially";
          value = desktops.Id_1;
        };
        maximizehoriz = {
          apply = "initially";
          value = true;
        };
        maximizevert = {
          apply = "initially";
          value = true;
        };
      };
      description = "Firefox";
      match = {
        window-class = {
          match-whole = true;
          type = "exact";
          value = "firefox firefox";
        };
      };
    }
  ];
}
