{ config, pkgs, ... }:
{
  environment.systemPackages            =   [ pkgs.git  ];

  home-manager.users."${config.self.userName}".programs.git
  = {
      enable                            =   true;
      delta.enable                      =   true;
      signing
      = {
          key                           =   config.self.gpgKeyID;
          signByDefault                 =   true;
        };
      userName                          =   config.self.fullName;
      userEmail                         =   config.self.emailAddress;
    };
}
