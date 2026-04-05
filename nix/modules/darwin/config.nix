{ localConfig, ... }:

{
  system.stateVersion = 5;
  nixpkgs.config.allowUnfree = true;                     # 允许安装非免费软件

  nix.settings = {
    trusted-users = [ localConfig.username ];            # 信任用户
  };

  users.users.${localConfig.username} = {
    home = localConfig.homeDirectory;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit localConfig; };
    users.${localConfig.username} = {
      imports = [
        ../../../home.nix
      ];
    };
  };
}
