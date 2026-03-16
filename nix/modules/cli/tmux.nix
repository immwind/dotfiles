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
      bind - split-window -v -c "#{pane_current_path}"
      bind | split-window -h -c "#{pane_current_path}"
  '';
  };
}