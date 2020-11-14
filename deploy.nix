{
  aleph
  =   {
        imports                         =   [ hosts/aleph/configuration.nix ];
        deployment
        =   {
              buildHost                 =   "sivizius@localhost";
              targetHost                =   "root@sivizius.eu";
            };
      };
  bet
  =   { config, ... }:
      {
        imports                         =   [ hosts/aleph/configuration.nix ];
        deployment
        =   {
              buildHost                 =   "sivizius@localhost";
              targetHost                =   "root@localhost";
            };
      };
}
