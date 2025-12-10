{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    packages = [
      "com.discordapp.Discord"
      "com.stremio.Stremio"
    ];

    uninstallUnmanaged = true;
    uninstallUnused = true;

    update = {
      auto.enable = false;
      onActivation = true;
    };
  };
}
