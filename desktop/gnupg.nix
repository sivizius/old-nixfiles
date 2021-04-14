{ config, home-manager, pkgs, ... }:
{
  environment.systemPackages            =   [ pkgs.gnupg  ];

  home-manager.users."root".services.gpg-agent
  =   {
        enable                          =   false;
        enableSshSupport                =   true;
      };

  programs.gnupg
  =   {
        agent
        =   {
              enable                    =   true;
              enableSSHSupport          =   true;
              pinentryFlavor            =   "qt";
            };
      };
}
