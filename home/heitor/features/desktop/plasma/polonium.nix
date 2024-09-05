{
  programs.plasma.kwin.scripts.polonium = {
    enable = true;
    settings = {
      borderVisibility = "borderAll";
      layout = {
        engine = "binaryTree";
        insertionPoint = "activeWindow";
      };
    };
  };
}
