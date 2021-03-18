{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        brightnessctl
        cpufrequtils
        flashrom
        gpsd
        linuxPackages.tp_smapi
        pciutils
        powertop
        tlp
        usbutils
      ];
}
