{ config, pkgs, ... }:
{
  boot                                  =
  {
    initrd                              =
    {
      network                           =
      {
        enable                          =   true;
        postCommands                    =
        ''
          echo 'cryptsetup-askpass' >> /root/.profile
        '';
        ssh                             =
        {
          authorizedKeys                =   [ ( builtins.readFile     ../public/auth.ssh  ) ];
          enable                        =   true;
          hostKeys                      =   [ ( config.self.secrets + "/initrd.ssh"       ) ];
          port                          =   2222;
        };
      };
    };
  };
}
