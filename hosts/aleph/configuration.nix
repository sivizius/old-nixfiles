# aleph (a silent letter in hebrew) is usually installed on sivizius@sivizius.eu
{ config, ... }:
{
  imports
  =   [
        ./hardware.nix
        ./network.nix

        # Applications
        ../../applications/files.nix
        ../../applications/nano
        ../../applications/git.nix
        ../../applications/htop.nix
        ../../applications/processes.nix
        ../../applications/ranger
        ../../applications/sync.nix
        ../../applications/terminal.nix
        ../../applications/zsh.nix

        # Common
        ../../common/acme.nix
        ../../common/boot.nix
        ../../common/environment.nix
        ../../common/initrd.nix
        ../../common/network.nix
        ../../common/system.nix
        ../../common/users.nix

        # Modules
        ../../modules/nano.nix
        ../../modules/self.nix

        # Services
        ../../services/bind
        ../../services/blog.nix
        ../../services/gitea.nix
        ../../services/home-manager.nix
        ../../services/monitoring
        ../../services/nginx.nix
        ../../services/simple-nix-mail.nix
        ../../services/static
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

  system.stateVersion                    =   "20.09";
}
