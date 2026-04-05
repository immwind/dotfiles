{ localConfig, ... }:

let
  shellProxy = localConfig.shellProxy;
  flakeAttr = localConfig.hostProfileName;
in
{
  programs.fish.functions.dot.body = ''
    if test (count $argv) -eq 0
      echo "usage: dot sync | dot help" >&2
      return 1
    end
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
        echo "usage: dot sync | dot help" >&2
        return 1
    end
  '';
}
