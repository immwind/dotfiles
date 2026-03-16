{ ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;  # 为 fish 启用 starship
    settings = {
      add_newline = true;          # 在每个提示符前添加一个空行
    };
  };
}