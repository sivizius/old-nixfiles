{
  aleph                                 =   { config, ... }:
  {
    imports                             =   [ hosts/aleph/configuration.nix ];
    deployment
    =   {
          buildHost                     =   "sivizius@localhost";
          targetHost                    =   "root@taurus";
        };
  };
}
