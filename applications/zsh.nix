{ config, home-manager, ... }:
{
  home-manager.users
  = {
      "${config.self.userName}".programs
      = {
          zsh                           =   config.home-manager.users.root.programs.zsh;
        };
      root.programs.zsh
      = {
          autocd                        =   true;
          enable                        =   true;
          enableAutosuggestions         =   true;
          enableCompletion              =   true;
          oh-my-zsh
          = {
              enable                    =   true;
              plugins
              = [
                  "git"
                  "pass"
                ];
              theme                     =   "candy";
            };
          shellAliases                  =   config.environment.shellAliases;
        };
    };
}
