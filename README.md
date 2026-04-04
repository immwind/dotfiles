# dotfiles

My dotfiles, powered by Nix.

## 关于 config.local.nix

把一些配置单独放在 config.local.nix 中统一管理，以便在不同设备使用时快速修改，下面是 config.example.nix 的示例说明：

```nix title="config.example.nix"
{
  stateVersion = "25.11";            # Home Manager 版本
  username = "username";             # 用户名
  homeDirectory = "/home/username";  # HOME 目录路径
  hostProfileName = "linux-server";  # Flake 配置文件名(涉及 hms 命令的参数)
  git = {
    userName= "username";            # Git 用户名
    userEmail = "email@example.com"; # Git 邮箱
  };
}
```

PS：在本地修改示例后会导致注释无法对齐，因此把 `config.example.nix` 中的注释移除了，统一放到
README.md 中。

