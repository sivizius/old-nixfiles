{ pkgs, ... }:
{
  environment                           =
  {
    etc                                 =
    {
      "mutt/colours.muttrc".source      =   ./colours.muttrc;
    };
    systemPackages                      =   with pkgs;
    [
      isync
      mailcap
      neomutt
    ];
  };
}
