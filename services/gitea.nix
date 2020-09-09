{ config, ... }:
{
  services                              =
  {
    gitea                               =
    {
      appName                           =   "_sivizius’ Gitea";
      cookieSecure                      =   true;
      database                          =
      {
        type                            =   "postgres";
        name                            =   "gitea";
        user                            =   "gitea";
      };
      disableRegistration               =   false;
      domain                            =   "git.${config.self.domain}";
      enable                            =   true;
      settings                          =
      {
        metrics                         =
        {
          ENABLED                       =   true;
          TOKEN                         =   builtins.readFile ( config.self.secrets + "/gitea.token"  );
        };
        picture                         =
        {
          DISABLE_GRAVATAR              =   true;
        };
        server                          =
        {
          START_SSH_SERVER              =   true;
          BUILTIN_SSH_SERVER_USER       =   "gitea";
          SSH_LISTEN_PORT               =   2222;
        };
        ui                              =
        {
          DEFAULT_THEME                 =   "arc-green";
        };
      };
      httpAddress                       =   "localhost";
      log.level                         =   "Warn";
      rootUrl                           =   "https://git.${config.self.domain}/";
    };

    nginx                               =
    {
      virtualHosts                      =
      {
        "git.${config.self.domain}"     =
        {
          enableACME                    =   true;
          extraConfig                   =   config.services.nginx.virtualHosts."${config.self.domain}".extraConfig;
          forceSSL                      =   true;
          locations."/".proxyPass       =   "http://localhost:${toString config.self.ports.gitea}/";
        };
      };
    };

    postgresql                          =
    {
      enable                            =   true;
      ensureDatabases                   =   [ "gitea" ];
      ensureUsers                       =
      [
        {
          name                          =   "gitea";
          ensurePermissions             =
          {
            "DATABASE gitea"            =   "ALL PRIVILEGES";
          };
        }
      ];
    };

    prometheus                          =
    {
      scrapeConfigs                     =
      [
        {
          bearer_token                  =   builtins.readFile ( config.self.secrets + "/gitea.token"  );
          job_name                      =   "gitea";
          metrics_path                  =   "/metrics";
          scheme                        =   "https";
          scrape_interval               =   "30s";
          static_configs                =
          [
            {
              targets                   =
              [
                "git.${config.self.domain}"
              ];
            }
          ];
        }
      ];
    };
  };
}
