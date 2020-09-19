{ pkgs, ... }:
{
  environment.systemPackages
  = with pkgs;
    [
      python3
      python37Packages.pwntools
      python37Packages.pygments
      python37Packages.pyserial
      #python37Packages.python-language-server
    ];
}
