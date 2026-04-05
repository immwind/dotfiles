# dotfiles

My dotfiles, powered by Nix.

## 关于 config.local.nix

把一些配置单独放在 `config.local.nix` 统一管理，以便在不同设备使用时快速修改：

```nix title="config.example.nix"
{
  stateVersion = "24.11";               # Home Manager 版本 (macOS Monterey 必须是 24.11)
  username = "username";                # 用户名
  homeDirectory = "/home/username";     # HOME 目录路径
  hostProfileName = "linux-server";     # 要使用的配置名(涉及 dot 命令的参数)
  hostPlatform = "x86_64-linux";        # 主机平台 (x86_64-linux / x86_64-darwin)
  shellProxy = "http://127.0.0.1:7890"; # 代理地址
  git = {
    userName= "username";               # Git 用户名
    userEmail = "email@example.com";    # Git 邮箱
  };
}
```

PS：在本地修改示例后会导致注释无法对齐，因此把 `config.example.nix` 中的注释移除了，统一放到
README.md 中。

