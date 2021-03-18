{ config, lib, ... }:
{
  networking.firewall
  =   {
        allowedTCPPorts                 =   [ 53 ];
        allowedUDPPorts                 =   [ 53 ];
      };

  services
  =   let
        domain                          =   config.self.domain;
        hostDomain                      =   "${config.self.hostName}.${domain}";
        master                          =   true;
        masters                         =   [ ];
        slaves
        =   [
              "2a01:4f8:c0c:473f::1"    # ns1.petabyte.dev / ns1.pbb.lc
              "2a0f:4ac0:0:1::1"        # ns2.petabyte.dev / ns2.pbb.lc
              "2a0f:4ac0::3"            # ns3.petabyte.dev / ns3.pbb.lc
            ];
        hetznerIPv6Forwarders
        =   [
              "2a01:4f8:0:1::add:1010"  # Hetzner
              "2a01:4f8:0:1::add:9999"  # Hetzner
              "2a01:4f8:0:1::add:9898"  # Hetzner
            ];
        googleIPv6Forwarders
        =   [
              "2001:4860:4860::8888"    # Google
              "2001:4860:4860::8844"    # Google
            ];
        hetznerIPv4Forwarders
        =   [
              "213.133.98.98"           # Hetzner
              "213.133.99.99"           # Hetzner
              "213.133.100.100"         # Hetzner
            ];
        googleIPv4Forwarders
        =   [
              "8.8.8.8"                 # Google
              "8.8.4.4"                 # Google
            ];
        domainList
        =   [
              domain
              hostDomain
              "blog.${domain}"
              "git.${domain}"
              "grafana.${domain}"
              "prometheus.${domain}"
              "static.${domain}"
            ];
        systemdAfterList
        =   builtins.listToAttrs
            (
              lib.lists.forEach domainList
              (
                domain:
                {
                  name                  =   "$acme-{domain}";
                  value                 =   { after = [ "bind.service"  ]; };
                }
              )
            );
      in
      {
        bind
        =   {
              enable                    =   true;
              forwarders
              =   hetznerIPv6Forwarders
              ++  googleIPv6Forwarders
              ++  hetznerIPv4Forwarders
              ++  googleIPv4Forwarders;
              cacheNetworks
              =   [
                    "127.0.0.0/8"
                    "::/64"
                  ];
              zones
              =   [{
                    name                =   config.self.domain;
                    file                =   "${./zones}/${config.self.domain}";
                    inherit master masters slaves;
                  }];
            };

        nginx.virtualHosts."${hostDomain}".locations."/metrics/bind"
        =   {
              extraConfig
              =   ''
                    allow ${config.self.ipv6range}:/64;
                    allow ${config.self.ipv4addr};
                    deny all;
                  '';
              proxyPass                 =   "http://localhost:${toString config.self.ports.exporters.bind}/metrics";
            };

        prometheus
        =   {
              exporters.bind
              =   {
                    enable              =   true;
                    port                =   config.self.ports.exporters.bind;
                  };
              scrapeConfigs
              =   [{
                    job_name            =   "bind";
                    metrics_path        =   "/metrics/bind";
                    scheme              =   "https";
                    scrape_interval     =   "30s";
                    static_configs
                    =   [{
                          targets       =   [ "${hostDomain}" ];
                        }];
                  }];
            };
      };

      #systemd.services                  =   systemdAfterList
}
