{ pkgs, ... }:
{
  environment
  = {
      shellAliases
      = {
          mestrenova
          = ''
              /run/current-system/sw/bin/wine ~/Executables/MestReNova/MestReNova.exe
            '';
        };
      systemPackages
      = with pkgs;
        [
          avogadro
        ];
    };
}
