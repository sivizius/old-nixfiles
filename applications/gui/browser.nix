{ pkgs, ... }:
{
  environment.systemPackages
  = with pkgs;
    [
      firefox-wayland
      qutebrowser
    ];
}
