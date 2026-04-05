{ ... }:

{
  imports = [ ./fish/functions.nix ];

  programs.fish = {
    enable = true;
    shellInit = ''
      # fish 启动时执行的命令
    '';
  };
}
