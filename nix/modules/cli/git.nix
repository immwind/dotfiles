{ localConfig, ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
      user.name = localConfig.git.userName;
      user.email = localConfig.git.userEmail;
    };
  };
}
