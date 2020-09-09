{ config, pkgs, ... }:
{
  users                                 =
  {
    users                               =
    {
      root                              =
      {
        shell                           =   pkgs.zsh;
      };
      "${config.self.userName}"         =
      {
        extraGroups                     =   [ "wheel" ];
        initialPassword                 =   "1337";
        isNormalUser                    =   true;
        openssh                         =
        {
          authorizedKeys                =
          {
            keyFiles                    =
            [
              ../public/auth.ssh
              ../public/_sivizius.ssh
            ];
          };
        };
        shell                           =   pkgs.zsh;
      };
    };
  };
}
