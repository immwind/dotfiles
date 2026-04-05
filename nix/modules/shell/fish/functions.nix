{ localConfig, ... }:

let
  shellProxy = localConfig.shellProxy;
  flakeAttr = localConfig.hostProfileName;
in
{
  programs.fish.functions.dot.body = ''
    if test (count $argv) -eq 0
      echo "usage: dot proxy | dot unproxy | dot sync | dot help" >&2
      return 1
    end
    switch $argv[1]
      case help -h --help
        echo "dot proxy              # 开启 HTTP(S) 代理 (universal)"
        echo "dot unproxy            # 关闭代理"
        echo "dot sync               # 应用 flake（home-manager / darwin-rebuild）"
      case proxy
        if test (count $argv) -gt 1
          echo "usage: dot proxy" >&2
          return 1
        end
        set -Ux all_proxy ${shellProxy}
        set -Ux http_proxy ${shellProxy}
        set -Ux https_proxy ${shellProxy}
        echo proxy=${shellProxy}
      case unproxy
        if test (count $argv) -gt 1
          echo "usage: dot unproxy" >&2
          return 1
        end
        set -eU all_proxy
        set -eU http_proxy
        set -eU https_proxy
        echo "proxy cleared"
      case sync
        if test (count $argv) -gt 1
          echo "usage: dot sync" >&2
          return 1
        end
        if test "$(uname -s)" = Darwin
          darwin-rebuild switch --flake ~/dotfiles#${flakeAttr}
        else
          home-manager switch --flake ~/dotfiles#${flakeAttr}
        end
      case '*'
        echo "usage: dot proxy | dot unproxy | dot sync | dot help" >&2
        return 1
    end
  '';
}
