{ ... }:

{
  imports = [
    ./cli/bat.nix
    ./cli/fish.nix
    ./cli/fzf.nix
    ./cli/git.nix
    ./cli/neovim.nix
    ./cli/starship.nix
    ./cli/tmux.nix
    ./common/shell.nix
  ];
}