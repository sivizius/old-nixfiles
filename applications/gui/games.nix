{ pkgs, ... }:
{
  environment                           =
  {
    systemPackages                      =   with pkgs;
    [
      #jdk14                             # for minecraft
      multimc
      sauerbraten
      xonotic
    ];
  };
}
