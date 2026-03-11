{
  description = "Home Manager configuration of double_u";

  # 声明外部依赖
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # 官方源 unstable 分支
    home-manager = {
      url = "github:nix-community/home-manager";         # home-manager 源
      inputs.nixpkgs.follows = "nixpkgs";                # 和 nixpkgs 版本一致
    };
  };

  # flake 输出定义
  outputs = { nixpkgs, home-manager, ... }: {
    # Home Manager 配置集合
    homeConfigurations = {
      # 用户@主机名的对应的配置
      "double_u@ubuntu" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;     # 指定软件包集
        modules = [ ./home.nix ];                       # 加载配置模块
      };
    };
  };
}
