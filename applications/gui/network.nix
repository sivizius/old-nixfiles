{ pkgs, ... }:
{
  environment.systemPackages
  = with pkgs;
    [
      openconnect
      tightvnc
    ];
}
