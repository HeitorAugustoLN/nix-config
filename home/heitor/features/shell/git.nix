{ osConfig, ... }:
{
  programs.git = {
    enable = true;
    extraConfig = {
      commit = {
        gpgsign = true;
      };
      core = {
        editor = "nvim";
      };
      gpg = {
        format = "ssh";
      };
      init = {
        defaultBranch = "main";
      };
      user = {
        signingkey = "${../../../../hosts/${osConfig.networking.hostName}/ssh_host_ed25519_key.pub}";
      };
    };
    userEmail = "IAm.HeitorALN@proton.me";
    userName = "Heitor Augusto";
  };
}
