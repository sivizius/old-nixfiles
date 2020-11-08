{ pkgs, ... }:
{
  environment.systemPackages
  = with pkgs;
    [
      bat
      hexyl
      icdiff
      jq
      lolcat
      libarchive
      ripgrep
      screen
      skim
      thefuck
      tmux
    ];
}
