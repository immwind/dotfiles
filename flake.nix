{
  description = "dotfiles: Nix configuration for Linux";

  # 声明外部依赖
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # 官方源 unstable 分支
    home-manager = {
      url = "github:nix-community/home-manager";         # home-manager 源
      inputs.nixpkgs.follows = "nixpkgs";                # 和 nixpkgs 版本一致
    };
  };

  # flake 输出定义
  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};             # 指定软件包集
    localConfig =
      if builtins.pathExists ./config.local.nix then
        import ./config.local.nix
      else
        import ./config.example.nix;
  in
  {
    # Home Manager 配置集合
    homeConfigurations = {
      # 主机名的对应的配置
      "linux-server" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {
          inherit localConfig;
        };
        modules = [ ./home.nix ./nix/hosts/linux-server.nix]; # 加载配置模块
      };
    };
  };
}
