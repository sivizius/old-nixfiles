{ config, pkgs, ... }:
{
  environment.systemPackages            =   [ pkgs.git  ];

  home-manager.users."${config.self.userName}".programs.git
  = {
      enable                            =   true;
      userName                          =   config.self.fullName;
      userEmail                         =   config.self.emailAddress;
    };
}
