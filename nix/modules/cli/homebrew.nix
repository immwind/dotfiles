{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;   # 获取最新的包列表
      upgrade = true;      # 升级已安装的包
      cleanup = "zap";     # 清理未在列表中的包
    };
  };
}
