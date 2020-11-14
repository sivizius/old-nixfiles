# gimel (third hebrew character) is usually installed on sivizius@gimel.sivizius.eu
{ config, ... }:
{
  imports                             =
  [
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
    ../../common/acme.nix                  #?
    ../../common/boot.nix
    ../../common/environment.nix
    ../../common/initrd.nix
    ../../common/network.nix
    ../../common/system.nix
    ../../common/users.nix

    # Modules
    ../../modules/self.nix

    # Services
    ../../services/blog.nix
    ../../services/gitea.nix
    ../../services/home-manager.nix
    ../../services/monitoring.nix
    ../../services/nginx.nix
  ];

  documentation.enable                  =   false;

  self                                  =
  {
    domain                              =   "sivizius.eu";
    hostName                            =   "gimel";
    ipv4addr                            =   "45.158.41.100";
    ipv6addr                            =   "2a0f:5381::4";
    ipv6range                           =   "2a0f:5381::/64";
    legacyTLS                           =   true;
    ports                               =
    {
      exporters                         =
      {
        bind                            =   9119;
        nginx                           =   9113;
        node                            =   9100;
      };
      gitea                             =   3000;
      grafana                           =   3001;
      prometheus                        =   9090;
    };
    secrets                             =   ./secrets;
    terminal                            =   "zsh";
    userName                            =   "sivizius";
  };

  system                                =
  {
    stateVersion                        =   "20.09";
  };
}
