#!/usr/bin/env bash

Program="$0"
if [ "$#" -lt "1" ]
then
  echo "usage: $Program HostConfig"
  echo "HostsConfig (RemoteHost):"
  echo "  aleph – Hetzner Cloud Server"
  echo "  bet   – T530 Laptop"
  echo "  gimel – Server by Milan and Fluepke at Wobcom"
else
  HostConfig="$1"
  shift 1
  export NIX_SSHOPTS="-t -i ~/Keys/private/hosts.ssh"

  echo -en "Test \e[36m$HostConfig\e[0m…"
  read
  cd "./$HostConfig/"
  if  /nix/var/nix/profiles/per-user/*/profile/bin/nixos-rebuild  \
      build-vm                                                    \
      -I  nixos-config=./default.nix                              \
      $@
  then
    ./result/bin/run-*-vm -vga virtio
  else
    echo "$Program: cannot build"
    exit 1
  fi
  echo -e "…\e[34mdone\e[0m"
fi
