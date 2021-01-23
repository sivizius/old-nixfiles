{ nixpkgs ? <nixpkgs> }:
let
  pkgs = import nixpkgs {};
  lib = pkgs.lib;
  evalConfig = import (nixpkgs + "/nixos/lib/eval-config.nix");

  hosts = import ../configuration/hosts;
  nixosHosts = lib.filterAttrs (name: host: host ? ssh) hosts;

  nixos = import (nixpkgs + "/nixos") {
    configuration = import ./kexec-host.nix;
  };
in
  nixos.config.system.build.kexec_tarball
