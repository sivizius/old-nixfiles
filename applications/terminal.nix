{ pkgs, ... }:
{
  environment                           =
  {
    systemPackages                      =   with pkgs;
    [
      bat
      jq
      lolcat
      ripgrep
      screen
      skim
      tmux
    ];
  };
}
