{ lib, pkgs, ... }:
{
  fonts
  = {
      fonts
      = with pkgs;
        [
          dejavu_fonts
          font-awesome_5
          liberation_ttf
          noto-fonts
          noto-fonts-emoji
          roboto
          roboto-mono
          roboto-slab
          unifont
        ];
      fontconfig
      = {
          localConf                     =   lib.fileContents ./fontconfig.xml;
          defaultFonts
          = {
              emoji                     =   [ "Noto Color Emoji"  ];
              serif                     =   [ "Dejavu Serif"      ];
              sansSerif                 =   [ "Roboto Condensed"  ];
              monospace                 =   [ "Roboto Mono"       ];
            };
        };
    };
}
