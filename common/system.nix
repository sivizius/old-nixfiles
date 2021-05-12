{ pkgs, ... }:
{
  nix
  =   {
        autoOptimiseStore               =   true;
        gc
        =   {
              automatic                 =   true;
              options                   =   "--delete-older-than 14d";
            };
        optimise
        =   {
              automatic                 =   true;
              dates                     =   [ "23:42" ];
            };
        trustedUsers
        =   [
              "root"
              "@wheel"
            ];
      };
  security.sudo.extraConfig
  =   let
        lecture
        =   builtins.toFile "arstotka.txt"
            ''
                                                 __________            __________
               ________________________________  \         \    __/\  /         /  ________________________________
              |                                \  \         |  |  // |         /  /                                |
              |                                 \  \        |__|  |__|        /  /                                 |
              |__________________________________\  \                        /  /__________________________________|
               ____________________________________  \                      /  ____________________________________
              |                                    \  \     |\__/\__/|     /  /                                    |
              |                                     \  \    |    //  |    /  /                                     |
              |______________________________________\  \   |   //   |   /  /______________________________________|
               ________________________________________  \  \  //    /  /   ________________________________________
              |                                        \  \  \      /  /  /                                        |
              |                                         \  \  \    /  /  /                                         |
              |__________________________________________\ _|  \__/  |_ /__________________________________________|
                                                          |/\        /\|
                                                            /_      _\
                                                              \    /
                                                               \  /
                                                                \/
                                                         GLORY TO ARSTOTZKA
               Welcome to Arstotka. All your actions will be monitored and reported to the Ministry of Information.
            '';
      in
        ''
          Defaults  lecture             =   always
          Defaults  lecture_file        =   ${lecture}
        '';

  system.autoUpgrade
  =   {
        allowReboot                     =   false;
        dates                           =   "04:20";
        enable                          =   false;
      };

  users
  =   {
        defaultUserShell                =   pkgs.zsh;
      };
}
