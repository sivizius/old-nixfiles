{ config, pkgs, ... }:
{
  environment.shellAliases.scan
  =   ''
        :(){
          unset -f :
          mkdir -p "$HOME/.scans"
          OUTPUT="$HOME/.scans/$(date -Iseconds).png"
          scanimage -d "hpaio:/net/ENVY_7640_series?ip=${config.self.scannerIP}" -o "$OUTPUT" $@
          notify-send -t 10000 "Scan saved to" "$OUTPUT"
        };:\
      '';
  hardware.sane
  =   {
        enable                          =   true;
        extraBackends
        =   with pkgs;
            [
              hplipWithPlugin
              #epkowa
              ];
    };
}
