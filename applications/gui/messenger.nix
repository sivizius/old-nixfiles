{ pkgs, ... }:
{
  environment
  = {
      systemPackages
      = with pkgs;
        [
          dino
          discord
          mumble
          #nheko
          tdesktop
          weechat
        ];
    };
}
