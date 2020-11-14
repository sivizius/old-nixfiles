{ config, ... }:
{
  imports
  =   [
        "${builtins.fetchGit
        {
          url                           =   "https://github.com/nix-community/home-manager";
          rev                           =   "472ca211cac604efdf621337067a237be9df389e";
        }}/nixos"
      ];
}
