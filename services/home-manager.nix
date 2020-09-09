{ config, ... }:
{
  imports                               =
  [
    "${builtins.fetchGit
    {
      url                               =   "https://github.com/rycee/home-manager";
      rev                               =   "03b4f81679456dc565722b38b18c27911b135d66";
    }}/nixos"
  ];
}
