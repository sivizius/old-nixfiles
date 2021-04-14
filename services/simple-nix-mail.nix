{ config, ... }:
{
  imports
  =   [
        (
          builtins.fetchTarball
          {
            # https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/releases
            url                         =   "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/4818b57a922cbf68e66d162c62116a2ab0005095/nixos-mailserver-4818b57a922cbf68e66d162c62116a2ab0005095.tar.gz";
            sha256                      =   "0v97a1nnl5a53whpv4nphkqb19r1np0if75dvh4l0k2da90sir2f";
          }
        )
      ];

  mailserver
  =   let
        accounts                        =   import  ( config.self.secrets + "/mail.nix" );
        domain                          =   config.self.domain;
      in
      {
        certificateScheme               =   3;
        domains                         =   [ config.self.domain ];
        enable                          =   true;
        enableImap                      =   true;
        enableImapSsl                   =   true;
        enableManageSieve               =   true;
        enablePop3                      =   true;
        enablePop3Ssl                   =   true;
        fqdn                            =   config.self.domain;
        localDnsResolver                =   false;
        loginAccounts                   =   accounts { self=config.self; };
        rejectRecipients                =   [ ];
        rejectSender                    =   [ ];
        virusScanning                   =   false;
      };
}
