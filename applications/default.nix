{ pkgs, ... }:
{
  imports
  = [
      ./adhd.nix
      ./crypto.nix
      ./development
      ./files.nix
      ./funny.nix
      ./git.nix
      ./gnupg.nix
      ./hardware.nix
      ./htop.nix
      ./mail
      ./micro.nix
      ./nano
      ./network.nix
      ./processes.nix
      ./ranger
      ./spelling.nix
      ./sway
      ./sync.nix
      ./terminal.nix
      #./termite
      ./zsh.nix
    ];
}
