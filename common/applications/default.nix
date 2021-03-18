{ pkgs, ... }:
{
  imports
  =   [
        ./crypto.nix
        ./files.nix
        ./htop.nix
        ./nano
        ./processes.nix
        ./ranger
        ./sync.nix
        ./terminal.nix
        ./zsh.nix
      ];
}
