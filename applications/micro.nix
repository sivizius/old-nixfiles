let
  cfgDir                                =   ".config/micro";
in
  { config, pkgs, ... }:
  {
    home-manager.users."${config.self.userName}"
    = {
        imports                         =   [ ../modules/micro/default.nix ];
        programs.micro
        = {
            enable                      =   true;
            bindings
            = {
                "Alt-/"                 =   "lua:comment.comment";
                "CtrlUnderscore"        =   "lua:comment.comment";
                "Alt-w"                 =   "PreviousSplit";
                "Alt-t"                 =   "command:tree";
              };
            colorschemes
            = {
                "sivican-dark"
                = {
                    "default"           =   "green";
                  };
              };
            extraSettings
            = {
              };
            plugins
            = [
                "autoclose"
                "comment"
                "diff"
                "ftoptions"
                "initlua"
                "linter"
                "literate"
                "status"
              ];
            settings
            = {
                colorcolumn             =   128;
                colorscheme             =   "default";
                diffgutter              =   true;
                divchars                =   "│─";
                ignorecase              =   true;
                mkparents               =   true;
                mouse                   =   false;
                parsecursor             =   true;
                rmtrailingws            =   true;
                savecursor              =   true;
                saveundo                =   true;
                scrollbar               =   false;
                scrollmargin            =   4;
                statusformatr           =   "";
                tabsize                 =   2;
                tabstospaces            =   true;
                xterm                   =   true;
              };
          };
      };
  }
