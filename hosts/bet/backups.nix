{ config, ... }:
{
  services.restic.backups
  = {
      "SivisBackup0"
      = {
          initialize                    =   true;
          passwordFile                  =   "${config.self.secrets}/backups/SivisBackup0";
          paths
          = [
              "/home/${config.self.userName}"
            ];
        };
    };
}
