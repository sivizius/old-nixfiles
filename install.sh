#!/usr/bin/env bash

partitionate()
{
  lsblk
  read -p "Device:      " device
  if [ -n "$device" ]
  then
    fdisk "$device"
  fi
}

encrypt()
{
  lsblk
  read -p "Device:      " device
  if [ -n "$device" ]
  then
    read -p "Virtual:     " virtual
    read -p "Label:       " label
    read -p "File System: " fileSystem
    read -p "Mountpoint:  " mountPoint
    cryptsetup luksFormat "$device"
    cryptsetup luksOpen   "$device" "$virtual"
    "mkfs.$fileSystem" -L "$label" "/dev/mapper/$virtual"
    mkdir -p "$mountPoint"
    mount "/dev/disk/by-label/$label" "$mountPoint"
  fi
}

repeat()
{
  while true
  do
    $@
    while true
    do
      read -p "Are you done? (Y/n)" didit
      case "$didit"
      in
        ""|"Y"|"y"|"yes")
          break 2
        ;;
        "N"|"n"|"no")
          break 1
        ;;
      esac
    done
  done
}

if [[ "$#" -lt "1" ]]
then
  echo "usage: $0 stage"
  exit 1
else
  stage="$1"
  shift 1
  case $stage
  in
    "prepare")
      echo "Prepare a NixOS-image locally and upload it…"
      if  nix-build '<nixpkgs/nixos>'                           \
            -I                nixos-config=./kexec.nix          \
            --attr            config.system.build.kexec_tarball \
            --no-build-output                                   \
            --max-jobs        4
      then
        ls -lahG result/tarball/*
        echo "You could upload it now."
      else
        echo "Failed to build image!"
        exit 1
      fi
    ;;
    "kexec")
      echo "Replace current system with NixOS…"
      ls -lahG $PWD/*
      read -p "Choose tarball: " tarball
      if [[ "$tarball" -ne "" ]]
      then
        tar -C / -xJvf "$tarball"
      fi
      /kexec_nixos
    ;;
    "install")
      echo "Start Installation Guide…"
      if [[ "$UID" -ne "0" ]]
      then
        echo "Need Root!"
        exit 1
      fi
      repeat partitionate
      repeat encrypt
      read -p "Swap Size in GiB: " swapSize
      if [[ "$swapSize" -ne "" ]]
      then
        dd if=/dev/zero of=/mnt/swapfile bs=1G count="$swapSize"
        chmod 600 /mnt/swapfile
        mkswap /mnt/swapfile
        swapon /mnt/swapfile
      fi
      nixos-generate-config --root /mnt
      nano /mnt/etc/nixos/*
    ;;
    *)
      echo "Unknown Stage »$stage«!"
      echo "Valid are:"
      echo "  prepare – prepare a local nix"
      echo "  kexec   – replace system with NixOS"
      echo "  install – installation guide"
      exit 1
    ;;
  esac
fi
echo "…done"
