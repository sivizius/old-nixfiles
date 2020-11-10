{ config, ... }:
{
  networking                            =
  {
    firewall                            =
    {
      allowedTCPPorts                   =   [ 53 ];
      allowedUDPPorts                   =   [ 53 ];
    };
  };

  services                              =
  let
    hostDomain                          =   "${config.self.hostName}.${config.self.domain}";
    master                              =   true;
    masters                             =   [ ];
    slaves                              =
    [
      "2a0f:4ac0::4"                    # ns1.petabyte.dev
      "2a0f:4ac0::3"                    # ns2.petabyte.dev
      "2a0f:4ac0:0:1::1"                # ns3.petabyte.dev
    ];
  in
  {
    bind                                =
    {
      enable                            =   true;
      forwarders                        =
      [
        "2a01:4f8:0:1::add:1010"        # Hetzner
        "2a01:4f8:0:1::add:9999"        # Hetzner
        "2a01:4f8:0:1::add:9898"        # Hetzner
        "2001:4860:4860::8888"          # Google
        "2001:4860:4860::8844"          # Google
        "213.133.98.98"                 # Hetzner
        "213.133.99.99"                 # Hetzner
        "213.133.100.100"               # Hetzner
        "8.8.8.8"                       # Google
        "8.8.4.4"                       # Google
      ];
      cacheNetworks                     =
      [
        "127.0.0.0/8"
        "::/64"
      ];
      zones                             =
      [
        {
          name                          =   config.self.domain;
          file                          =   "${./zones}/${config.self.domain}";
          inherit master masters slaves;
        }
      ];
    };

    nginx                               =
    {
      virtualHosts                      =
      {
        "${hostDomain}"                 =
        {
          locations                     =
          {
            "/metrics/bind"             =
            {
              extraConfig               =
              ''
                allow ${config.self.ipv6range}/64;
                allow ${config.self.ipv4addr};
                deny all;
              '';
              proxyPass                 =   "http://localhost:${toString config.self.ports.exporters.bind}/metrics";
            };
          };
        };
      };
    };

    prometheus                          =
    {
      exporters                         =
      {
        bind                            =
        {
          enable                        =   true;
          port                          =   config.self.ports.exporters.bind;
        };
      };
      scrapeConfigs                     =
      [
        {
          job_name                      =   "bind";
          metrics_path                  =   "/metrics/bind";
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
  };

  /*
  systemd                               =
  let
    domain                              =   config.self.domain;
    hostDomain                          =   "${config.self.hostName}.${config.self.domain}";
  in
  {
    services                            =
    {
      "acme-${domain}".after            =   [ "bind.service"  ];
      "acme-${hostDomain}".after        =   [ "bind.service"  ];
      "acme-blog.${domain}".after       =   [ "bind.service"  ];
      "acme-git.${domain}".after        =   [ "bind.service"  ];
      "acme-grafana.${domain}".after    =   [ "bind.service"  ];
      "acme-prometheus.${domain}"       =
      {
        after                           =   [ "bind.service"  ];
      };
      "acme-static.${domain}".after     =   [ "bind.service"  ];
    };
  };
  */
}
