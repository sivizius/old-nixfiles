{ config, pkgs, ... }:
{
  environment                           =
  {
    systemPackages                      =   with pkgs;
    [
      micro
    ];
  };
  home-manager                          =
  {
    users                               =
    {
      "${config.self.userName}"         =
      {
        home.file                       =
        {
          ".config/micro".source        =   ./config;
        };
      };
    };
  };
}
