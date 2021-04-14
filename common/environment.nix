{ config, pkgs, ... }:
{
  console
  =   {
        font                            =   "Roboto Mono";
        keyMap                          =   "de";
      };
  #fonts.fontconfig.defaultFonts.emoji   =   [ "Noto Color Emoji 100" ];
  environment
  =   {
        shellAliases
        =   {
              c                         =   "${pkgs.ncurses}/bin/clear";
              dis
              =   ''
                    :(){
                      unset -f :
                      ${pkgs.binutils}/bin/objdump -M intel $@ 2>&1 | ${pkgs.python37Packages.pygments}/bin/pygmentize -l objdump-nasm 2> /dev/zero | ${pkgs.less}/bin/less
                    };:\
                  '';
              enby                      =   "${pkgs.man-db}/bin//man";
              frg
              =   ''
                    :(){
                      unset -f :
                      regex="$1"
                      shift 1
                      echo $@
                      echo $regex
                      ${pkgs.findutils}/bin/find $@ | ${pkgs.ripgrep}/bin/rg $regex
                    };:\
                  '';
              fuck
              =   ''
                    :(){
                      unset -f :
                      TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                      export TF_SHELL=${pkgs.zsh}/bin/zsh;
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
              nixsh                     =   "${pkgs.nix}/bin/nix-shell --run ${pkgs.zsh}/bin/zsh ";
              l                         =   "${pkgs.exa}/bin/exa -l@ah";
              l2                        =   "${pkgs.exa}/bin/exa -lahTL2";
              l3                        =   "${pkgs.exa}/bin/exa -lahTL3";
              l4                        =   "${pkgs.exa}/bin/exa -lahTL4";
              l5                        =   "${pkgs.exa}/bin/exa -lahTL5";
              lt                        =   "${pkgs.exa}/bin/exa -lahTL";
              n                         =   "${pkgs.nano}/bin/nano";
              please                    =   "${pkgs.sudo}/bin/sudo";
              py                        =   "${pkgs.python3}/bin/python3";
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
              use                       =   "${pkgs.nix}/bin/nix-shell --run ${pkgs.zsh}/bin/zsh -p ";
            };
        shellInit
        =   ''
              mkdir -p ${config.programs.nano2.backupDirectory}
              export TERM=xterm
            '';
      };

  i18n.defaultLocale                    =   "C.UTF-8";
  time.timeZone                         =   "Europe/Berlin";
}
