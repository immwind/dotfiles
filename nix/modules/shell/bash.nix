{ ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ "$(ps -o comm= -p $PPID 2>/dev/null)" != "fish" ]]; then
        exec fish
      fi
    '';
  };
}
