#!/usr/bin/env bash

if [ "$#" -lt "2" ]
then
  echo "usage: $0 HostConfig RemoteHost"
  echo "HostsConfig (RemoteHost):"
  echo "  aleph (aleph.sivizius.eu) – Hetzner Cloud Server"
  echo "  bet   (localhost)         – T530 Laptop"
  echo "  gimel (gimel.sivizius.eu) – Server by Milan and Fluepke at Wobcom"
else
  HostConfig="$1"
  RemoteHost="$2"
  shift 2
  export NIX_SSHOPTS=" -t -i ~/Keys/private/hosts.ssh"

  echo -en "Deploy \e[36m$HostConfig\e[0m on \e[35m$RemoteHost\e[0m…"
  read # To make sure, the right configuration gets deployed on the right machine.
  cd "./hosts/$HostConfig/"
  TimeStart="$(date +%s)"
  nixos-rebuild switch                                    \
    --use-remote-sudo                                     \
    --build-host      "localhost"                         \
    --target-host     "$RemoteHost"                       \
    -I                nixos-config="./configuration.nix"  \
    $@
  TimeFinal="$(date +%s)"
  Duration=$((TimeFinal-TimeStart))
  Duration=$(date +"%d, %H:%M:%S" -ud "@$Duration")
  #Days=$((Duration/60/60/24))
  #Hours=$((Duration/60/60%24))
  #Minutes=$((Duration/60%60))
  #Seconds=$((Duration%60))
  echo -e "…\e[34mdone\e[0m ($Duration)"
fi
