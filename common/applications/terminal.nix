{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        bat
        hexyl
        icdiff
        jq
        libarchive
        ripgrep
        screen
        skim
        tmux
      ];
}
