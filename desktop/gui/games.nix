{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        jdk15_headless                  # for minecraft
        multimc
        #sauerbraten
        xonotic
      ];
}
