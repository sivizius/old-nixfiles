{ pkgs, ... }:
{
  imports
  =   [
        ./python.nix
        ./rust.nix
      ];
  environment.systemPackages
  =   with pkgs;
      [
        binutils
        clang
        glib
        glibc
        lua
        nim
        patchelf
        pkg-config
        stdenv
        #swift
      ];
}
