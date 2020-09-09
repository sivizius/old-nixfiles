{ pkgs, ... }:
{
  imports                               =
  [
    ./python.nix
    ./rust.nix
  ];
  environment                           =
  {
    systemPackages                      =   with pkgs;
    [
      clang
      glib
      glibc
      lua
      micro
      nim
      swift
    ];
  };
}
