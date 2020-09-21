{ pkgs, ... }:
{
  imports
  = [
      ./adhd.nix
      ./crypto.nix
      ./development/default.nix
      ./files.nix
      ./funny.nix
      ./git.nix
      ./gnupg.nix
      ./hardware.nix
      ./htop.nix
      ./mail/default.nix
      ./micro.nix
      ./nano/default.nix
      ./network.nix
      ./processes.nix
      ./ranger/default.nix
      ./spelling.nix
      ./sway/default.nix
      ./sync.nix
      ./terminal.nix
      ./termite/default.nix
      ./zsh.nix
    ];
}
