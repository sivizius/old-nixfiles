# nixfiles
Personal configuration-files by [\_sivizius](https://sivizius.eu) for [NixOS](https://nixos.org/) and the Nix package manager.

##  Files and Directories
* `deploy.sh`       – Bash-Script to deploy a host-configuration to a machine (IP/domain).
* `LICENCE.md`      – The licence of this work, see Licence-section below.
* `README.md`       – This document.
* `common/`         – Common configuration shared by multiple hosts.
* `desktop/`        – Common configuration for desktop hosts.
* `hosts/`          
  * Host-specific configuration, see Hosts-section below.
  * Each host-directory contains…
    * …a central `configuration.nix` used by `deploy.sh` and usually
    * …a `hardware.nix`,
    * …a `network.nix` and
    * …a hidden `secrets/`-directory for host-specific secrets.
* `modules/`        – Nix-Modules: Meta-Configuration used by the configuration-files in the other directories.
* `services/`       – Services that run in the background, usually as systemd-units like webservers.
* `users/`          – Users that might have access to one or the other system, including their public keys.

## Hosts
* `aleph`
  * א is silent letter in hebrew and the very fist in the alphabet.
  * My very first server.
  * Usually installed on [sivizius.eu](sivizius.eu).
* `bet`
  * ב, both second letter of the hebrew alphabet and pronounced like the hebrew word בית meaning »house« or »home«.
  * Configuration for my main desktop-machine/laptop.
  * Usually installed on localhost.
* `gimel`
  * ג third letter of the hebrew alphabet.
  * Not in use yet.

##  Licence
This work is published under the … licence, see the `LICENCE.md`-file.
