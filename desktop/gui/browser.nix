{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        chromium
        firefox-wayland
        qutebrowser
      ];
}
