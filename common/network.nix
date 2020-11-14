{ config, pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        iftop
        iperf
        mtr
        ncat
        nload
        tcpdump
        telnet
        wget
      ];
  networking
  =   {
        hostName                        =   config.self.hostName;
        useDHCP                         =   false;
      };
  programs.mtr.enable                   =   true;
  services.openssh.enable               =   true;
}
