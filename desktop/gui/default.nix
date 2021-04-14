{ pkgs, ... }:
{
  imports
  =   [
        ./atom.nix
        ./browser.nix
        ./chemistry.nix
        ./darkweb.nix
        ./data.nix
        ./emulation.nix
        ./games.nix
        ./gnome.nix
        ./media.nix
        ./messenger.nix
        ./notifications.nix
        ./pentesting.nix
        ./redshift.nix
        ./sway
        ./terminal.nix
      ];

  environment.systemPackages
  =   with pkgs;
      [
        deluge
        spotify
        xournal
      ];
}
