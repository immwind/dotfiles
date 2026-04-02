{ localConfig, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      hms = "home-manager switch --flake ~/dotfiles#${localConfig.flakeProfileName}";
    };
    shellInit = ''
      # fish 启动时执行的命令
    '';
  };
}