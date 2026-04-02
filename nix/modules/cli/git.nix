{ localConfig, ... }:

{
  programs.git = {
    enable = true;
    settings.user.name = localConfig.git.userName;
    settings.user.email = localConfig.git.userEmail;
  };
}
