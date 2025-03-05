{
  catppuccin.brave.enable = true;

  programs.brave = {
    enable = true;

    extensions = [
      # Bitwarden
      { id = "nngceckbapebfimnlniiiahkandclblb"; }
      # Catppuccin for GitHub File Explorer Icons
      { id = "lnjaiaapbakfhlbjenjkhffcdpoompki"; }
      # Dark Reader
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }
      # FrankerFaceZ
      { id = "fadndhdgpmmaapbmfcknlfgcflmmmieb"; }
      # LanguageTool
      { id = "oldceeleldhonbafppcapldpdifcinji"; }
      # Return YouTube dislike
      { id = "gebbhagfogifgggkldgodflihgfeippi"; }
      # Skip redirect
      { id = "jaoafjdoijdconemdmodhbfpianehlon"; }
      # Sponsorblock for YouTube
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; }
      # Stylus
      { id = "clngdbkpkpeebahjckkjfobafhncgmne"; }
      # Violentmonkey
      { id = "jinjaccalgkegednnccohejagnlnfdag"; }
    ];
  };
}
