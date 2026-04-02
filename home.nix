{ config, pkgs, localConfig, ... }:

{
  imports = [
    ./nix/modules/base.nix
  ];

  home.username = localConfig.username;           # 用户名
  home.homeDirectory = localConfig.homeDirectory; # HOME 目录路径

  home.stateVersion = localConfig.stateVersion;   # Home Manager 版本
  home.packages = [];                             # 安装 Nix 软件包
  home.file = {};                                 # 需要管理的文件
  home.sessionVariables = {};                     # 配置 Shell 环境变量

  programs.home-manager.enable = true;            # 让 Home Manager 管理自身
}