{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        atk.dev
        gdk-pixbuf.dev
        gnome3.adwaita-icon-theme
        gnome3.nautilus
        gtk3.dev
        hicolor-icon-theme
        libappindicator-gtk3
        pango.dev
      ];
  services.gnome3.at-spi2-core.enable   =   true;
}
