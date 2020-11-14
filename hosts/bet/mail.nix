{ config, ... }:
{
  home-manager.users."${config.self.userName}".home.file
  =   {
        ".mail/account".source          =   "${config.self.secrets}/mail/account";
        ".mail/folder".source           =   "${config.self.secrets}/mail/folder";
        ".mbsyncrc".source              =   "${config.self.secrets}/mail/mbsyncrc";
        ".muttrc".source                =   "${config.self.secrets}/mail/muttrc";
      };
}
