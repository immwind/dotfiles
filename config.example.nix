{
  stateVersion = "25.11";            # Home Manager 版本
  username = "username";             # 用户名
  homeDirectory = "/home/username";  # HOME 目录路径
  flakeProfileName = "linux-server"; # Flake 配置文件名(涉及 hms 命令的参数)
  git = {
    userName= "username";            # Git 用户名
    userEmail = "email@example.com"; # Git 邮箱
  };
}