{ config, ... }:
{
  imports                               =
  [
    (
      builtins.fetchTarball
      {
        # https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/releases
        url                             =   "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/v2.3.0/nixos-mailserver-v2.3.0.tar.gz";
        sha256                          =   "0lpz08qviccvpfws2nm83n7m2r8add2wvfg9bljx9yxx8107r919";
      }
    )
  ];

  mailserver                            =
  let
    accounts                            =   import  ( config.self.secrets + "/mail.nix" );
    domain                              =   config.self.domain;
    userName                            =   config.self.userName;
  in
  {
    certificateScheme                   =   3;
    domains                             =   [ config.self.domain ];
    enable                              =   true;
    enableImap                          =   true;
    enableImapSsl                       =   true;
    enableManageSieve                   =   true;
    enablePop3                          =   true;
    enablePop3Ssl                       =   true;
    fqdn                                =   config.self.domain;
    localDnsResolver                    =   false;
    loginAccounts                       =   accounts { self=config.self; };
    rejectRecipients                    =   [ ];
    rejectSender                        =   [ ];
    virusScanning                       =   false;
  };
}
