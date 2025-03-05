{ inputs', ... }:
{
  home.packages = [ inputs'.neovim.packages.nvim ];
}
