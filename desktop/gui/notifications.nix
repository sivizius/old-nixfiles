{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        libnotify
        mako
      ];
}
