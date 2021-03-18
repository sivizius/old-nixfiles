# aleph (a silent letter in hebrew) is usually installed on sivizius@sivizius.eu
{ config, ... }:
{
  imports
  =   [
        ./hardware.nix
        ./network.nix
        ../../common

        # Modules
        ../../modules/nano.nix
        ../../modules/self.nix

        # Services
        ../../services/bind
        ../../services/blog.nix
        ../../services/gitea
        ../../services/home-manager.nix
        ../../services/monitoring
        ../../services/nginx.nix
        ../../services/simple-nix-mail.nix
        ../../services/static

        # Users
        ../../users/root.nix
        ../../users/sivizius.nix
      ];

  documentation.enable                  =   false;

  self
  =   {
        domain                          =   "sivizius.eu";
        hostName                        =   "aleph";
        ipv4addr                        =   "95.217.131.201";
        ipv6addr                        =   "2a01:4f9:c010:6bf5::23";
        ipv6range                       =   "2a01:4f9:c010:6bf5:";
        legacyTLS                       =   true;
        ports
        =   {
              exporters
              =   {
                    bind                =   9119;
                    nginx               =   9113;
                    node                =   9100;
                  };
              gitea                     =   3000;
              grafana                   =   3001;
              prometheus                =   9090;
            };
        secrets                         =   ./secrets;
        terminal                        =   "zsh";
        userName                        =   "sivizius";
      };
}
