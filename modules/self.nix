{ lib, pkgs, config, ... }:
let
  mkStringOption
  =   (
        example:
        description:
          lib.mkOption
          {
            default                     =   "";
            type                        =   lib.types.str;
            inherit description example;
          }
      );

  mkPortOption
  =   (
        default:
        description:
          lib.mkOption
          {
            type                        =   lib.types.port;
            inherit default description;
          }
      );

  mkActivatableOption
  =   (
        description:
          lib.mkOption
          {
            default                     =   false;
            example                     =   true;
            type                        =   lib.types.bool;
            inherit description;
          }
      );

  mkDeactivatableOption
  =   (
        description:
          lib.mkOption
          {
            default                     =   true;
            example                     =   false;
            type                        =   lib.types.bool;
            inherit description;
          }
      );

  portOptions
  =   {
        exporters
        =   lib.mkOption
            {
              type
              =   lib.types.submodule
                  {
                    options
                    =   {
                          bind          =   mkPortOption        9119                  "";
                          nginx         =   mkPortOption        9113                  "";
                          node          =   mkPortOption        9100                  "";
                        };
                  };
            };
        gitea                           =   mkPortOption        3000                  "";
        grafana                         =   mkPortOption        3001                  "";
        prometheus                      =   mkPortOption        9090                  "";
      };
in
{
  options.self
  =   {
        # Deployment
        hostName                        =   mkStringOption      "example"             "";

        # User
        userName                        =   mkStringOption      "jdoe"                "The ";
        passWord                        =   mkStringOption      "1337"                "Default Password of this user";
        fullName                        =   mkStringOption      "John Doe"            "";
        emailAddress                    =   mkStringOption      "example@example.com" "";
        gpgKeyID                        =   mkStringOption      "3AA5C34371567BD2"    "";

        # Applications
        terminal                        =   mkStringOption      "xterm"               "";

        # Networking
        domain                          =   mkStringOption      "example.com"         "";
        ipv4addr                        =   mkStringOption      "1.2.3.4"             "";
        ipv6addr                        =   mkStringOption      "1337::1"             "";
        ipv6range                       =   mkStringOption      "1337::0/64"          "";
        legacyTLS                       =   mkActivatableOption                       "";
        minimal                         =   mkActivatableOption                       "";
        ports
        =   lib.mkOption
            {
              type
              =   lib.types.submodule
                  {
                    options             =   portOptions;
                  };
            };
        scannerIP                       =   mkStringOption      "1.3.3.7"             "";

        # Secrets
        secrets
        =   lib.mkOption
            {
              type                      =   lib.types.path;
              default                   =   ./secret;
              example                   =   ./secrets;
              description               =   "";
            };
      };
}
