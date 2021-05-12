{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        qemu
        wine
      ];
}
