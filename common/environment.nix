{ config, ... }:
{
  console                               =
  {
    font                                =   "Roboto Mono";
    keyMap                              =   "de";
  };
  fonts.fontconfig.defaultFonts.emoji = [ "Noto Color Emoji 100" ];
  environment                           =
  {
    shellAliases                        =
    {
      c                                 =   "/run/current-system/sw/bin/clear";
      dis                               =
      ''
        :(){
          unset -f :
          /run/current-system/sw/bin/objdump -M intel $@ 2>&1 | /run/current-system/sw/bin/pygmentize -l objdump-nasm 2> /dev/zero | /run/current-system/sw/bin/less
        };:\
      '';
      enby                              =   "/run/current-system/sw/bin//man";
      frg                               =
      ''
        :(){
          unset -f :
          regex="$1"
          shift 1
          echo $@
          echo $regex
          /run/current-system/sw/bin/find $@ | /run/current-system/sw/bin/rg $regex
        };:\
      '';
      fuck                              =
      ''
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
      man                               =   "echo 'Use enby […], Fight teh cistem!'";
      nixsh                             =   "/run/current-system/sw/bin/nix-shell --run zsh ";
      l                                 =   "/run/current-system/sw/bin/exa -lahG";
      l2                                =   "/run/current-system/sw/bin/exa -lahTL2";
      l3                                =   "/run/current-system/sw/bin/exa -lahTL3";
      l4                                =   "/run/current-system/sw/bin/exa -lahTL4";
      l5                                =   "/run/current-system/sw/bin/exa -lahTL5";
      lt                                =   "/run/current-system/sw/bin/exa -lahTL";
      n                                 =   "/run/current-system/sw/bin/nano";
      please                            =   "sudo";
      py                                =   "/run/current-system/sw/bin/python3";
      rainbow                           =
      ''
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
      term                              =   "/run/current-system/sw/bin/${config.self.terminal}";
      use                               =   "/run/current-system/sw/bin/nix-shell --run zsh -p ";
    };
    shellInit                           =
    ''
      mkdir -p ~/.nano/backups
      export TERM=xterm
    '';
  };

  i18n.defaultLocale                    =   "C.UTF-8";
  time.timeZone                         =   "Europe/Berlin";
}
