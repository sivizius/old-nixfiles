{ config, ... }:
{
  networking                            =
  {
    defaultGateway6                     =
    {
      address                           =   "fe80::1";
      interface                         =   "ens3";
    };

    interfaces                          =
    {
      ens3                              =
      {
        ipv6.addresses                  =
        [
          {
            address                     =   "${config.self.ipv6addr}";
            prefixLength                =   64;
          }
        ];
        useDHCP                         =   true;
      };
    };
  };
}
