{ config, ... }:
{
  services                              =
  let
    domain                              =   config.self.domain;
    hostDomain                          =   "${config.self.hostName}.${config.self.domain}";
    ipv4addr                            =   "${config.self.ipv4addr}";
    ipv6range                           =   "${config.self.ipv6range}:/64";
    ports                               =   config.self.ports;
  in
  {
    grafana                             =
    {
      auth.anonymous.enable             =   true;
      domain                            =   "grafana.${domain}";
      enable                            =   true;
      port                              =   ports.grafana;
      provision                         =
      {
        enable                          =   true;
        datasources                     =
        [
          {
            isDefault                   =   true;
            name                        =   "Prometheus";
            type                        =   "prometheus";
            url                         =   "https://prometheus.${domain}/";
          }
        ];
        dashboards                      =
        [
          {
            options.path                =   ./dashboards;
          }
        ];
      };
      rootUrl                           =   "https://grafana.${domain}/";
    };

    journald.extraConfig                =
    ''
      MaxRetentionSec                   =   "3day"
    '';

    nginx                               =
    {
      virtualHosts                      =
      {
        "${hostDomain}"                 =
        {
          enableACME                    =   true;
          extraConfig                   =   config.services.nginx.virtualHosts."${domain}".extraConfig;
          forceSSL                      =   true;
          locations                     =
          {
            "/metrics/nginx"            =
            {
              extraConfig               =
              ''
                allow ${ipv6range};
                allow ${ipv4addr};
                deny all;
              '';
              proxyPass                 =   "http://localhost:${toString ports.exporters.nginx}/metrics";
            };
            "/metrics/node"             =
            {
              extraConfig               =
              ''
                allow ${ipv6range};
                allow ${ipv4addr};
                deny all;
              '';
              proxyPass                 =   "http://localhost:${toString ports.exporters.node}/metrics";
            };
          };
        };

        "grafana.${domain}"             =
        {
          enableACME                    =   true;
          forceSSL                      =   true;
          locations."/".proxyPass       =   "http://localhost:${toString ports.grafana}/";
        };

        "prometheus.${domain}"          =
        {
          enableACME                    =   true;
          extraConfig                   =   config.services.nginx.virtualHosts."${domain}".extraConfig;
          forceSSL                      =   true;
          locations                     =
          {
            "/"                         =
            {
              extraConfig               =
              ''
                allow ${ipv6range};
                allow ${ipv4addr};
                #deny all;
              '';
              proxyPass                 =   "http://localhost:${toString ports.prometheus}/";
              proxyWebsockets           =   true;
            };
          };
        };
      };
    };

    prometheus                          =
    {
      enable                            =   true;
      exporters                         =
      {
        nginx                           =
        {
          enable                        =   true;
          port                          =   ports.exporters.nginx;
        };
        node                            =
        {
          enable                        =   true;
          port                          =   ports.exporters.node;
        };
      };
      scrapeConfigs                     =
      [
        {
          job_name                      =   "nginx";
          metrics_path                  =   "/metrics/nginx";
          scheme                        =   "https";
          scrape_interval               =   "30s";
          static_configs                =
          [
            {
              targets                   =
              [
                "${hostDomain}"
              ];
            }
          ];
        }
        {
          job_name                      =   "node";
          metrics_path                  =   "/metrics/node";
          scheme                        =   "https";
          scrape_interval               =   "30s";
          static_configs                =
          [
            {
              targets                   =
              [
                "${hostDomain}"
              ];
            }
          ];
        }
      ];
    };

    vnstat.enable                       =   true;
  };
}
