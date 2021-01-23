{ config, lib, pkgs, ... }:
{
  imports                               =   [ <nixpkgs/nixos/modules/profiles/qemu-guest.nix> ];

  boot
  =   {
        extraModulePackages             =   [ ];
        initrd
        =   {
              availableKernelModules
              =   [
                    "ata_piix"
                    "sd_mod"
                    "sr_mod"
                    "virtio_pci"
                    "xhci_pci"
                  ];
              kernelModules             =   [ ];
              /*luks.devices."encrypted"
              =   {
                    device              =   "/dev/disk/by-label/encrypted";
                  };*/
              luks.devices."encrypted".device   =   "/dev/disk/by-uuid/09675dae-475b-47ff-8969-c5dee915b943";
            };
        kernelModules                   =   [ ];
        loader.grub
        =   {
              devices                   =   [ "/dev/sda"  ];
              enable                    =   true;
              version                   =   2;
            };
      };

  nix.maxJobs                           =   lib.mkDefault 1;
  swapDevices                           =   [ ];

  fileSystems
  =   {
        "/"
        =   {
              device                    =   "/dev/disk/by-uuid/2c26bb06-d932-486d-b48b-365d6cfc076e";
              fsType                    =   "xfs";
            };
        "/boot"
        =   {
              device                    =   "/dev/disk/by-uuid/F276-B461";
              fsType                    =   "vfat";
            };
      };
}
