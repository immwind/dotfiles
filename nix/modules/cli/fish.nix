{ localConfig, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      hms = "home-manager switch --flake ~/dotfiles#${localConfig.hostProfileName}";
    };
    shellInit = ''
      # fish 启动时执行的命令
    '';
  };
}