# bet (from hebrew בית: house) is usually installed on localhost.
{ config, pkgs, ... }:
{
  imports
  =   [
        #./backups.nix
        ./hardware.nix
        ./mail.nix
        ./network.nix
        ./ssh.nix
        ../../common
        ../../desktop

        # Modules
        ../../modules/nano.nix
        ../../modules/self.nix

        # Services
        ../../services/home-manager.nix

        # Users
        ../../users/root.nix
        ../../users/sivizius.nix
      ];

  nixpkgs.config
  =   {
        allowUnfree                     =   true;
      };

  environment.systemPackages
  =   with pkgs;
      [
        nix-index
        nix-prefetch-git
        nix-prefetch-github
        xdg_utils
      ];

  self
  =   {
        hostName                        =   "bet";
        emailAddress                    =   "sivizius@sivizius.eu";
        fullName                        =   "Sebastian Walz";
        gpgKeyID                        =   "7BB421C684E821D8";
        scannerIP                       =   "192.168.178.28";
        secrets                         =   ./secrets;
        terminal                        =   "alacritty";
        userName                        =   "sivizius";
      };
}
