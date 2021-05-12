{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        jdk16                           # for minecraft
        multimc
        #sauerbraten
        xonotic
      ];
}
