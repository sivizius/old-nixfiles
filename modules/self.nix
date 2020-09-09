{ lib, pkgs, config, ... }:
{
  options.self                          =
  {
    domain                              =   lib.mkOption
    {
      default                           =   "";
      type                              =   lib.types.str;
    };
    emailAddress                        =   lib.mkOption
    {
      default                           =   "";
      type                              =   lib.types.str;
    };
    fullName                            =   lib.mkOption
    {
      default                           =   "";
      type                              =   lib.types.str;
    };
    hostName                            =   lib.mkOption
    {
      type                              =   lib.types.str;
    };
    ipv4addr                            =   lib.mkOption
    {
      default                           =   "";
      type                              =   lib.types.str;
    };
    ipv6addr                            =   lib.mkOption
    {
      default                           =   "";
      type                              =   lib.types.str;
    };
    ipv6range                           =   lib.mkOption
    {
      default                           =   "";
      type                              =   lib.types.str;
    };
    legacyTLS                           =   lib.mkOption
    {
      default                           =   false;
      type                              =   lib.types.bool;
    };
    minimal                             =   lib.mkOption
    {
      default                           =   false;
      type                              =   lib.types.bool;
    };
    ports                               =   lib.mkOption
    {
      type                              =   lib.types.submodule
      {
        options                         =
        {
          exporters                     =   lib.mkOption
          {
            type                        =   lib.types.submodule
            {
              options                   =
              {
                bind                    =   lib.mkOption
                {
                  default               =   9119;
                  type                  =   lib.types.port;
                };
                nginx                   =   lib.mkOption
                {
                  default               =   9113;
                  type                  =   lib.types.port;
                };
                node                    =   lib.mkOption
                {
                  default               =   9100;
                  type                  =   lib.types.port;
                };
              };
            };
          };
          gitea                         =   lib.mkOption
          {
            default                     =   3000;
            type                        =   lib.types.port;
          };
          grafana                       =   lib.mkOption
          {
            default                     =   3001;
            type                        =   lib.types.port;
          };
          prometheus                    =   lib.mkOption
          {
            default                     =   9090;
            type                        =   lib.types.port;
          };
        };
      };
    };
    scannerIP                           =   lib.mkOption
    {
      type                              =   lib.types.str;
    };
    secrets                             =   lib.mkOption
    {
      type                              =   lib.types.path;
      default                           =   ./secret;
    };
    terminal                            =   lib.mkOption
    {
      type                              =   lib.types.str;
    };
    userName                            =   lib.mkOption
    {
      type                              =   lib.types.str;
    };
  };
}
