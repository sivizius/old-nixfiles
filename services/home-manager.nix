{ config, ... }:
{
  imports
  =   [
        "${builtins.fetchGit
        {
          url                           =   "https://github.com/nix-community/home-manager";
          rev                           =   "cc60c22c69e6967b732d02f072a9f1e30454e4f6";
        }}/nixos"
      ];
}
