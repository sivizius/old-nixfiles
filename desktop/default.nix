{ config, ... }:
{
  imports
  =   [
        ./development
        ./fonts
        ./funny.nix
        ./gnupg.nix
        ./gui
        ./hardware
        ./spelling.nix
        ./tuc.nix
      ];
}
