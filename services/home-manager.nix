{ config, ... }:
{
  imports                               =
  [
    "${builtins.fetchGit
    {
      url                               =   "https://github.com/nix-community/home-manager";
      rev                               =   "249650a07ee2d949fa599f3177a8c234adbd1bee";
    }}/nixos"
  ];
}
