{ config, lib, ... }:
{
  environment.shellAliases
  =   let
        tucVPN                          =   import "${config.self.secrets}/network/tucVPN.nix";
      in
      {
        tucVPN                          =   "${lib.concatStringsSep "" tucVPN}";
      };
  networking
  =   {
        interfaces
        =   {
              enp0s25.useDHCP           =   true;
              wlp3s0.useDHCP            =   true;
              wwp0s20u4i6.useDHCP       =   true;
            };
        wireless
        =   {
              enable                    =   true;
              interfaces                =   [ "wlp3s0"  ];
              networks                  =   import "${config.self.secrets}/network/wpaSupplicant.nix";
              userControlled.enable     =   true;
            };
      };

  services.udev.extraRules
  =   ''
        ATTRS{idVendor}=="0bdb", ATTRS{idProduct}=="1926", ENV{ID_USB_INTERFACE_NUM}=="09", ENV{MBM_CAPABILITY}="gps_nmea"
        ATTRS{idVendor}=="0bdb", ATTRS{idProduct}=="1926", ENV{ID_USB_INTERFACE_NUM}=="03", ENV{MBM_CAPABILITY}="gps_ctrl"
      '';
}
