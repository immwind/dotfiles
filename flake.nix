{
  description = "dotfiles: Nix configuration for Linux and macOS";

  nixConfig = {
    extra-experimental-features = [ "nix-command" "flakes" ];

    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };

  # 声明外部依赖
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # 为兼容 macOS Monterey 的配置
    nixpkgs-2411.url = "github:nixos/nixpkgs/nixos-24.11"; # Monterey

    nix-darwin-monterey = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs-2411";
    };

    home-manager-monterey = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-2411";
    };
  };

  outputs = inputs@{
    nixpkgs,
    home-manager,
    nixpkgs-2411,
    nix-darwin-monterey,
    home-manager-monterey,
    ...
  }:

  let
    localConfig =
      if builtins.pathExists ./config.local.nix then
        import ./config.local.nix
      else
        import ./config.example.nix;
  in
  {
    # Home Manager
    homeConfigurations = {
      "linux-server" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${localConfig.hostPlatform};
        extraSpecialArgs = { inherit localConfig; };
        modules = [
          ./home.nix
          ./nix/hosts/linux-server.nix
        ];
      };
    };

    # macOS Monterey（Intel）
    darwinConfigurations = {
      "darwin-intel" = nix-darwin-monterey.lib.darwinSystem {
        system = localConfig.hostPlatform;
        specialArgs = {
          inherit localConfig;
          dotfiles = ./.;
        };
        modules = [
          ./nix/hosts/darwin-intel.nix
          home-manager-monterey.darwinModules.home-manager
        ];
      };
    };
  };
}
