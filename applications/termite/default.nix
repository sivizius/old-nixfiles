{ config, home-manager, pkgs, ... }:
{
  environment                           =
  {
    systemPackages                      =   with pkgs;
    [
      (
        termite.overrideAttrs
        (
          oldAttrs:
          {
            patches                     =   oldAttrs.patches ++
            [
              ./clipboard.patch
            ];
          }
        )*/
      )
    ];
  };
  home-manager                          =
  {
    users                               =
    {
      "${config.self.userName}"         =
      {
        programs                        =
        {
          termite                       =
          {
            allowBold                   =   true;
            audibleBell                 =   false;
            backgroundColor             =   "rgba(0,0,0,0)";
            browser                     =   "qutebrowser";
            clickableUrl                =   true;
            cursorBlink                 =   "off";
            dynamicTitle                =   true;
            enable                      =   true;
            foregroundColor             =   "#fff";
          };
        };
      };
    };
  };
}
