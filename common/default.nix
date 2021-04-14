{ config, ... }:
{
  imports
  =   [
        ./applications
        ./boot.nix
        ./environment.nix
        ./network.nix
        ./system.nix
      ];
  system.stateVersion                   =   "20.09";
}
