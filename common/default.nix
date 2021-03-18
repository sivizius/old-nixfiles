{ ... }:
{
  imports
  =   [
        ./applications
        ./boot.nix
        ./environment.nix
        ./git.nix
        ./network.nix
        ./system.nix
      ];
  system.stateVersion                   =   "20.09";
}
