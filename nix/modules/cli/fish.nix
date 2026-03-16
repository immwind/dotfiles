{ ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      hms = "home-manager switch --flake ~/dotfiles#double_u@ubuntu";
    };
    shellInit = ''
      # fish 启动时执行的命令
    '';
  };
}