{ ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;       # 为 fish 启用 fzf 集成
    tmux = {
      enableShellIntegration = true;    # 为 tmux 启用 fzf 集成
    };
  };
}