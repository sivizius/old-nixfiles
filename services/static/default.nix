{ config, ... }:
{
  environment.etc."static".source       =   ./files;
  services                              =
  {
    nginx                               =
    {
      enable                            =   true;
      virtualHosts                      =
      {
        "static.${config.self.domain}"  =
        {
          enableACME                    =   true;
          extraConfig                   =   config.services.nginx.virtualHosts."${config.self.domain}".extraConfig;
          forceSSL                      =   true;
          locations."/".root            =   "/etc/static/";
        };
      };
    };
  };
}
