{ pkgs, ... }:
{
  environment.systemPackages
  = with pkgs;
    [
      blueman
      openconnect
      tightvnc
    ];
}
