{ config, pkgs, ... }:
{
  environment.systemPackages
  = with pkgs;
    [
      bind
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

                  };
            };
      };
}
