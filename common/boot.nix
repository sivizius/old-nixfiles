{ pkgs, ... }:
{
  boot
  =   {
        enableContainers                =   true;
        kernelPackages                  =   pkgs.linuxPackages_latest;
      };
}
