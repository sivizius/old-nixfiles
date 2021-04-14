{ config, ... }:
let
  giteaDomain                           =   "git.${config.self.domain}";
  giteaSettings
  =   {
        attachment
        =   {
              ALLOWED_TYPES             =   "*/*";
            };
        #mailer?
        metrics
        =   {
              ENABLED                   =   true;
              TOKEN                     =   builtins.readFile ( config.self.host + "/secrets/gitea.token"  );
            };
        picture
        =   {
              DISABLE_GRAVATAR          =   true;
            };
        repository
        =   {
              PREFERRED_LICENSES        =   "AGPL-3.0,GPL-3.0,GPL-2.0,LGPL-3.0,LGPL-2.1";
            };
        server
        =   {
              START_SSH_SERVER          =   true;
              BUILTIN_SSH_SERVER_USER   =   "gitea";
              SSH_LISTEN_PORT           =   2222;
            };
        #service?
        ui
        =   {
              DEFAULT_THEME             =   "arc-green";
              THEMES                    =   "gitea,arc-green";
              THEME_COLOR_META_TAG      =   "#222222";
            };
      };
in
  {
    services
    =   {
          gitea
          =   {
                appName                 =   "_sivizius’ Gitea";
                cookieSecure            =   true;
                database
                =   {
                      type              =   "postgres";
                      name              =   "gitea";
                      user              =   "gitea";
                    };
                disableRegistration     =   false;
                domain                  =   giteaDomain;
                enable                  =   true;
                httpAddress             =   "localhost";
                log.level               =   "Warn";
                rootUrl                 =   "https://${giteaDomain}/";
                settings                =   giteaSettings;
                #stateDir?
                #mailerPasswordFile?
              };

          nginx.virtualHosts."${giteaDomain}"
          =   {
                enableACME              =   true;
                extraConfig             =   config.services.nginx.virtualHosts."${config.self.domain}".extraConfig;
                forceSSL                =   true;
                locations."/".proxyPass =   "http://localhost:${toString config.self.ports.gitea}/";
              };

          postgresql
          =   {
                enable                  =   true;
                ensureDatabases         =   [ "gitea" ];
                ensureUsers
                =   [{
                      name              =   "gitea";
                      ensurePermissions."DATABASE gitea"
                      =   "ALL PRIVILEGES";
                    }];
              };

          prometheus.scrapeConfigs
          =   [{
                bearer_token            =   builtins.readFile ( config.self.host + "/secrets/gitea.token"  );
                job_name                =   "gitea";
                metrics_path            =   "/metrics";
                scheme                  =   "https";
                scrape_interval         =   "30s";
                static_configs
                =   [{
                      targets           =   [ giteaDomain ];
                    }];
              }];
        };
  }
