{ config, pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        bind
        blueman
        openconnect
        tightvnc
        w3m
      ];

  home-manager.users."${config.self.userName}".programs.ssh
  =   {
        enable                          =   true;
        controlMaster                   =   "auto";
        controlPersist                  =   "10m";
        hashKnownHosts                  =   true;
        matchBlocks
        =   {
              "*.sivizius.eu"
              =   {
                    certificateFile     =   [ "~/Keys/private/hosts.ssh"  ];
                    checkHostIP         =   true;
                    compression         =   true;
                    forwardAgent        =   true;
                    forwardX11          =   false;
                    hostname            =   "sivizius.eu";
                    user                =   "sivizius";
                  };
            };
        userKnownHostsFile              =    "~/.ssh/known_hosts";
      };
}
