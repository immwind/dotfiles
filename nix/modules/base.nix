{ ... }:

{
  imports = [
    ./cli/bat.nix
    ./cli/fish.nix
    ./cli/git.nix
    ./cli/neovim.nix
    ./cli/starship.nix
    ./common/shell.nix
  ];
}