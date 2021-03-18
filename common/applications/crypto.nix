{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        cryptsetup
        ecdsautils
        keyutils
        openssl
        pwgen-secure
      ];
}
