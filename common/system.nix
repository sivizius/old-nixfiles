{ pkgs, ... }:
{
  nix
  =   {
        autoOptimiseStore               =   true;
        gc
        =   {
              automatic                 =   true;
              options                   =   "--delete-older-than 14d";
            };
        optimise
        =   {
              automatic                 =   true;
              dates                     =   [ "23:42" ];
            };
        trustedUsers
        =   [
              "root"
              "@wheel"
            ];
      };

  system.autoUpgrade
  =   {
        allowReboot                     =   false;
        dates                           =   "04:20";
        enable                          =   false;
      };

  users
  =   {
        defaultUserShell                =   pkgs.zsh;
      };
}
