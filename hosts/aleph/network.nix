{ config, ... }:
{
  boot.initrd
  =   {
        network
        =   {
              enable                    =   true;
              postCommands
              =   ''
                    echo 'cryptsetup-askpass' >> /root/.profile
                  '';
              ssh
              =   {
                    authorizedKeys      =   config.users.users."sivizius".openssh.authorizedKeys.keys;
                    enable              =   true;
                    # List of Paths to Private Keys as Strings.
                    hostKeys            =   [ "/etc/initrdSecret.ssh"  ];
                    port                =   2222;
                  };
            };
      };

  networking
  =   {
        defaultGateway6
        =   {
              address                   =   "fe80::1";
              interface                 =   "ens3";
            };

        interfaces.ens3
        =   {
              ipv6.addresses
              =   [{
                    address             =   "${config.self.ipv6addr}";
                    prefixLength        =   64;
                  }];
              useDHCP                   =   true;
            };
      };

  security.acme
  =   {
        acceptTerms                     =   true;
        email                           =   "cert@${config.self.domain}";
      };
}
