{ config, pkgs, ... }:

{
  imports = [
    ./nix/modules/base.nix
  ];

  # 配置用户名和主目录路径
  home.username = "double_u";
  home.homeDirectory = "/home/double_u";

  home.stateVersion = "25.11"; # Home Manager 版本
  home.packages = [];          # 安装 Nix 软件包
  home.file = {};              # 需要管理的文件
  home.sessionVariables = {};  # 配置 Shell 环境变量

  # shell 别名
  home.shellAliases = {
    hms = "home-manager switch --flake ~/dotfiles#double_u@ubuntu";
  };

  programs.bash.enable = true;         # 接管 bash
  programs.home-manager.enable = true; # 让 Home Manager 管理自身
}