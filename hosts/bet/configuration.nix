# bet (from hebrew בית: house) is usually installed on localhost.
{ config, pkgs, ... }:
{
  imports
  = [
      #./backups.nix
      ./hardware.nix
      ./mail.nix
      ./network.nix
      ./ssh.nix

      # Applciations
      ../../applications/default.nix

      # Common
      ../../common/boot.nix
      ../../common/environment.nix
      ../../common/fonts.nix
      ../../common/network.nix
      ../../common/printer.nix
      ../../common/pulseaudio.nix
      ../../common/scanner.nix
      ../../common/system.nix
      ../../common/trackpoint.nix
      ../../common/tuc.nix
      ../../common/users.nix

      # Modules
      ../../modules/nano.nix
      ../../modules/self.nix

      # Services
      ../../services/home-manager.nix
    ];

  nixpkgs
  = {
      config
      = {
          allowUnfree                   =   true;
          permittedInsecurePackages
          = [
              "p7zip-16.02"             # Remove as soon as possible
            ];
        };
    };

  environment
  = {
      systemPackages
      = with pkgs;
        [
          nix-index
          nix-prefetch-git
          nix-prefetch-github
          xdg_utils
        ];
    };

  self
  = {
      hostName                          =   "bet";
      emailAddress                      =   "sivizius@sivizius.eu";
      fullName                          =   "Sebastian Walz";
      scannerIP                         =   "192.168.178.28";
      secrets                           =   ./secrets;
      terminal                          =   "termite";
      userName                          =   "sivizius";
    };

  system
  = {
      stateVersion                      =   "20.09";
    };

  services.gnome3.at-spi2-core.enable   =   true;

  users
  = {
      users
      = {
          "${config.self.userName}"
          = {
              extraGroups
              = [
                  "lpadmin"
                  "network"
                  "scanner"
                  "video"
                ];
            };
        };
    };
}
