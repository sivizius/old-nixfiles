{ config, ... }:
{
  services                              =
  {
    nginx                               =
    {
      enable                            =   true;
      virtualHosts                      =
      {
        "blog.${config.self.domain}"  =
        {
          enableACME                    =   true;
          extraConfig                   =   config.services.nginx.virtualHosts."${config.self.domain}".extraConfig;
          forceSSL                      =   true;
          locations."/".root            =   "/var/blog/";
        };
      };
    };
  };
}
