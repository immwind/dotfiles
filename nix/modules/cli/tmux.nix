{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;                # 窗口索引从 1 开始
    clock24 = true;               # 使用 24 小时制
    mouse = true;                 # 启用鼠标支持
    prefix = "c-a";               # 前缀键
    keyMode = "vi";               # 使用 vi 模式
    terminal = "xterm-256color";  # 终端类型
    historyLimit = 5000;          # 历史记录限制

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = power-theme;
        extraConfig = ''
          set -g @tmux_power_theme 'redwine'
        '';
      }
    ];

    extraConfig = ''
      bind - split-window -v -c "#{pane_current_path}"  # 垂直分割窗口
      bind | split-window -h -c "#{pane_current_path}"  # 水平分割窗口

      bind f display-popup -E -w 70% -h 50% "fzf"       # 使用 fzf 搜索文件

      # 禁用本地 prefix 后把状态栏移到顶部，并改为 snow 主题
      bind -T root ` \
        set prefix None \;\
        set key-table off \;\
        set status-position top \;\
        set -g @tmux_power_theme 'snow' \;\
        run-shell ${pkgs.tmuxPlugins.power-theme.rtp} \;\
        refresh-client -S

      # 恢复本地 prefix 和状态栏到底部，并改回 redwine 主题
      bind -T off ` \
        set -u prefix \;\
        set -u key-table \;\
        set -u status-position \;\
        set -g @tmux_power_theme 'redwine' \;\
        run-shell ${pkgs.tmuxPlugins.power-theme.rtp} \;\
        refresh-client -S
  '';
  };
}