{ ... }: {
  targets.genericLinux.enable = true;      # 非 NixOS 发行版的 Linux 需要配置
  targets.genericLinux.gpu.enable = false; # 关闭非 NixOS GPU 集成
}