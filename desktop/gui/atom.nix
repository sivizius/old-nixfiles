{ pkgs, ... }:
{
  environment
  =   {
        shellInit
        =   ''
              ELECTRON_TRASH=gio
              '';
        systemPackages                  =   [ pkgs.atom ];
      };
}
