{ pkgs, ... }:
{
  environment.systemPackages
  = with pkgs;
    [
      bat
      jq
      lolcat
      libarchive
      ripgrep
      screen
      skim
      tmux
    ];
}
