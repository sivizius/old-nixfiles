{ pkgs, ... }:
{
  environment.systemPackages            =   with pkgs;  [ system-config-printer ];
  services.printing
  =   {
        drivers                         =   [ pkgs.hplip  ];
        enable                          =   true;
      };
}
