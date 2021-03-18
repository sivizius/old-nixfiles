{ config, ... }:
{
  imports
  =   [
        ./adhd.nix
        ./bluetooth.nix
        ./development
        ./fonts
        ./funny.nix
        ./gnupg.nix
        ./gui
        ./hardware.nix
        ./mail
        ./micro.nix
        ./network.nix
        ./printer.nix
        ./pulseaudio.nix
        ./scanner.nix
        ./spelling.nix
        ./sway
        ./trackpoint.nix
        ./tuc.nix
      ];

  users.users."${config.self.userName}".extraGroups
  =   [
        "lpadmin"
        "network"
        "scanner"
        "video"
      ];
}
