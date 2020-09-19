{ pkgs, ... }:
{
  environment.systemPackages
  = with pkgs;
    [
      bind
      w3m
    ];
}
