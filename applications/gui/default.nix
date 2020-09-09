{ pkgs, ... }:
{
  imports                               =
  [
    ./chemistry.nix
    ./darkweb.nix
    ./data.nix
    ./emulation.nix
    ./media.nix
    ./messenger.nix
    ./network.nix
    ./notifications.nix
    ./pentesting.nix
  ];

  environment                           =
  {
    systemPackages                      =   with pkgs;
    [
      deluge
      firefox-wayland
      gnome3.adwaita-icon-theme
      gnome3.nautilus
      hicolor-icon-theme
      qutebrowser
      spotify
      xournal
    ];
  };
}
