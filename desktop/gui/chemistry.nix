{ pkgs, ... }:
{
  environment
  =   {
        shellAliases
        =   {
              mestrenova
              =   ''
                    /run/current-system/sw/bin/wine ${../../hidden/MestReNova}/MestReNova.exe
                  '';
            };
        systemPackages                  =   [ pkgs.avogadro ];
      };
}
