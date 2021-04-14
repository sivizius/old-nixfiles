{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        git
        restic
        rsync
        sshfs
      ];
}
