{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      [[ $- == *i* && -z "$IN_FISH" ]] && export IN_FISH=1 && exec ${pkgs.fish}/bin/fish
    '';
  };
}
