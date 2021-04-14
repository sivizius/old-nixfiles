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
        desktop                         =   mkActivatableOption                       "Is this a desktop host?";

        # Deployment
        hostName                        =   mkStringOption      "example"             "Name of the host.";

        # Networking
        domain                          =   mkStringOption      "example.com"         "Domain name of this host.";
        ipv4addr                        =   mkStringOption      "1.2.3.4"             "Static legacy IP address of this host.";
        ipv6addr                        =   mkStringOption      "1337::1"             "Static IP address of this host.";
        ipv6range                       =   mkStringOption      "1337::0/64"          "Static IP range of this host.";
        legacyTLS                       =   mkActivatableOption                       "If set, deprecated tls-versions, or if cleared, only version 1.3 will be accepted.";
        minimal                         =   mkActivatableOption                       "Build a minmal NixOS.";
        ports
        =   lib.mkOption
            {
              type
              =   lib.types.submodule
                  {
                    options             =   portOptions;
                  };
            };

        # Secrets
        secrets
        =   lib.mkOption
            {
              type                      =   lib.types.path;
              default                   =   ./secret;
              example                   =   ./secrets;
              description               =   "Path do host-specific secrets. Deprecated without alternative *shrug*.";
            };

        users
        =   lib.mkOption
            {
              type                      =   lib.types.listOf lib.types.str;
              example                   =   [ "sivizius"  ];
              description               =   "List of users on this system.";
            };
      };

  /*config
  =   rec
      {
        cfg = lib.foldl (left: right: left // right) {}
        (
          builtins.map
          (
            user:
              import ( ../users + "/${user}" ) { inherit config pkgs; }
          )
          config.self.users
        );
      }.cfg;*/
}
