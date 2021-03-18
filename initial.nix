# a simple rescue-config
{ config, pkgs, ... }:
{
  imports
  =   [
        ./hardware-configuration.nix
      ];

  boot
  =   {
        initrd
        =   {
              network
              =   {
                    enable              =   true;
                    postCommands
                    =   ''
                          echo 'cryptsetup-askpass' >> /root/.profile
                        '';
                    ssh
                    =   {
                          authorizedKeys
                          =   [
                                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDR1eqjiJKg2fUHpCBQxVyqfaiJMhUsN0UOO6uAzm04bbEOYb+iFGV/6IZ65egQ2UmBzbghU7Wm0ngfk8PNsfZkwtfQGm9VNcU00O7gNxH29/HaRZ1fhjFVTtJCw8AQmgVlz7/bgGb2Tpr9KjuUI/R1Lmp68/2JEhmP1Uztl8mbf82vW8dpIHVlUO+YlCrP03EAFJPnTyYGv74Fw7COJCdUHmfpuOO/38sOe89nSzUskws9CjxJ4D0tG3v323EOPcY2hs0xa1mZQY/FV96Cj6Cr5XH0TKqfe7LI2MDhzven/loANRQaR1YuZ0FW59Hf4V8xBLpVhho5gCx7oJH99K20rc7agDzKy1tt61Yd/nK2Fp5xUkOvKd3ZDdXbrPuK2fPaSyNZHQBBI2zdld/jGsmCFc3sUTIleghUAPNyc/kVmyXqdI3y9UwIN6y5Ed7PwhRiLlQjdI54B9/ANI/WO7phk7d4V6G0sNMeNXFji5hiHGxKfsroVsb3aW3PdUbjfpc= hosts.ssh:Hosting/ssh@hetzner"
                              ];
                          enable        =   true;
                          hostKeys      =   [ "/etc/initrd.ssh" ];
                          port          =   2223;
                        };
                  };
            };
        kernelPackages                  =   pkgs.linuxPackages_latest;
        loader.grub
        =   {
              enable                    =   true;
              device                    =   "/dev/sda";
              version                   =   2;
            };
      };

  console
  =   {
        font                            =   "Roboto Mono";
        keyMap                          =   "de";
      };

  environment
  =   {
        shellAliases
        =   {
              c                         =   "/run/current-system/sw/bin/clear";
              dis
              =   ''
                    :(){
                      unset -f :
                      /run/current-system/sw/bin/objdump -M intel $@ 2>&1 | /run/current-system/sw/bin/pygmentize -l objdump-nasm 2> /dev/zero | /run/current-system/sw/bin/less
                    };:\
                  '';
              enby                      =   "/run/current-system/sw/bin//man";
              frg
              =   ''
                    :(){
                      unset -f :
                      regex="$1"
                      shift 1
                      echo $@
                      echo $regex
                      /run/current-system/sw/bin/find $@ | /run/current-system/sw/bin/rg $regex
                    };:\
                  '';
              fuck
              =   ''
                    :(){
                      unset -f :
                      TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                      export TF_SHELL=zsh;
                      export TF_ALIAS=fuck;
                      TF_SHELL_ALIASES=$(alias);
                      export TF_SHELL_ALIASES;
                      TF_HISTORY="$(fc -ln -10)";
                      export TF_HISTORY;
                      export PYTHONIOENCODING=utf-8;
                      TF_CMD=$(thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@) && eval $TF_CMD;
                      unset TF_HISTORY;
                      export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                      test -n "$TF_CMD" && print -s $TF_CMD
                    };:\
                  '';
              man                       =   "echo 'Use enby […], Fight teh cistem!'";
              nixsh                     =   "/run/current-system/sw/bin/nix-shell --run zsh ";
              l                         =   "/run/current-system/sw/bin/exa -l@ah";
              l2                        =   "/run/current-system/sw/bin/exa -lahTL2";
              l3                        =   "/run/current-system/sw/bin/exa -lahTL3";
              l4                        =   "/run/current-system/sw/bin/exa -lahTL4";
              l5                        =   "/run/current-system/sw/bin/exa -lahTL5";
              lt                        =   "/run/current-system/sw/bin/exa -lahTL";
              n                         =   "/run/current-system/sw/bin/nano";
              please                    =   "sudo";
              py                        =   "/run/current-system/sw/bin/python3";
              rainbow
              =   ''
                    for x in {0..8}
                    do
                      for i in {30..37}
                      do
                        for a in {40..47}
                        do
                          echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
                        done
                        echo ""
                      done
                    done
                  '';
              use                       =   "/run/current-system/sw/bin/nix-shell --run zsh -p ";
            };
        shellInit
        =   ''
              mkdir -p ~/.nano/backups
              export TERM=xterm
            '';
      };

  i18n.defaultLocale                    =   "C.UTF-8";

  networking
  =   {
        hostName                        =   "rescue";
        defaultGateway6
        =   {
              address                   =   "fe80::1";
              interface                 =   "ens3";
            };

        interfaces.ens3
        =   {
              ipv6.addresses
              =   [{
                      address           =   "2a01:4f9:c010:6bf5::23";
                      prefixLength      =   64;
                  }];
              useDHCP                   =   true;
            };
        useDHCP                         =   false;
      };

  time.timeZone                         =   "Europe/Berlin";

  users.users
  =   {
        root.shell                      =   pkgs.zsh;
        "rescue"
        =   {
              extraGroups               =   [ "wheel" ];
              initialPassword           =   "1337";
              isNormalUser              =   true;
              openssh.authorizedKeys.keyFiles
              =   [
                    ./public/auth.ssh
                    ./public/_sivizius.ssh
                  ];
              shell                     =   pkgs.zsh;
            };
      };
}
