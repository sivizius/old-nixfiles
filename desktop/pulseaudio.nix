{ pkgs, ... }:
{
  hardware.pulseaudio
  =   {
        enable                          =   true;
        extraModules                    =   [ pkgs.pulseaudio-modules-bt ];
        extraConfig
        =   ''
              load-module module-switch-on-connect
            '';
        package                         =   pkgs.pulseaudioFull;
      };
  nixpkgs.config.pulseaudio             =   true;
  sound.enable                          =   true;
}
