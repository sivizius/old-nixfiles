{ lib, pkgs, config, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/netboot/netboot-minimal.nix>
    ../common/boot.nix
    ../common/environment.nix
    ../common/users.nix
    ../modules/self.nix
  ];

  self
  =   {
        domain                          =   "sivizius.eu";
        hostName                        =   "aleph";
        ipv4addr                        =   "95.217.131.201";
        ipv6addr                        =   "2a01:4f9:c010:6bf5::23";
        ipv6range                       =   "2a01:4f9:c010:6bf5:";
        legacyTLS                       =   true;
        ports
        =   {
              exporters
              =   {
                    bind                =   9119;
                    nginx               =   9113;
                    node                =   9100;
                  };
              gitea                     =   3000;
              grafana                   =   3001;
              prometheus                =   9090;
            };
        secrets                         =   ./secrets;
        terminal                        =   "zsh";
        userName                        =   "sivizius";
      };

  boot.loader.grub.enable = false;
  systemd.services.sshd.wantedBy = lib.mkForce [ "multi-user.target" ];
  networking.hostName = "kexec";
  services.openssh.enable               =   true;

  services.nginx.enable = lib.mkForce false;
  security.acme.certs = lib.mkForce {};

  #networking.usePredictableInterfaceNames = false;
  #networking.interfaces.eth0.ipv4.addresses = [
  #  { address = "..."; prefixLength = ...; }
  #];
  #networking.interfaces.eth0.ipv6.addresses = [
  #  { address = "..."; prefixLength = ...; }
  #];
  #networking.defaultGateway6 = { address = "fe80::1"; interface = "eth0"; };
  #networking.defaultGateway = { address = "..."; interface = "eth0"; };
  #networking.nameservers = [
  #  "2606:4700:4700::1111"
  #  "2606:4700:4700::1001"
  #  "1.1.1.1"
  #  "1.0.0.1"
  #];

  system.build = rec {
    image = pkgs.runCommand "image" { buildInputs = [ pkgs.nukeReferences ]; } ''
      mkdir $out
      cp ${config.system.build.kernel}/bzImage $out/kernel
      cp ${config.system.build.netbootRamdisk}/initrd $out/initrd
      echo "init=${builtins.unsafeDiscardStringContext config.system.build.toplevel}/init ${toString config.boot.kernelParams}" > $out/cmdline
      nuke-refs $out/kernel
    '';
    kexec_script = pkgs.writeTextFile {
      executable = true;
      name = "kexec-nixos";
      text = ''
        #!${pkgs.stdenv.shell}
        export PATH=${pkgs.kexectools}/bin:${pkgs.cpio}/bin:$PATH
        set -xe
        kexec -l ${image}/kernel --initrd=${image}/initrd --append="init=${builtins.unsafeDiscardStringContext config.system.build.toplevel}/init ${toString config.boot.kernelParams}"
        sync
        echo "executing kernel, filesystems will be improperly umounted"
        kexec -e
      '';
    };
  };
  system.build.kexec_tarball = pkgs.callPackage <nixpkgs/nixos/lib/make-system-tarball.nix> {
    storeContents = [
      { object = config.system.build.kexec_script; symlink = "/kexec_nixos"; }
    ];
    contents = [];
  };
}
