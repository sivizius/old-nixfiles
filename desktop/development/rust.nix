{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        cargo
        cargo-about
        cargo-asm
        cargo-audit
        cargo-bloat
        cargo-crev
        cargo-deny
        cargo-deps
        cargo-edit
        cargo-expand
        cargo-embed
        cargo-flamegraph
        cargo-flash
        cargo-fuzz
        cargo-geiger
        cargo-generate
        cargo-graph
        cargo-inspect
        cargo-license
        cargo-make
        cargo-outdated
        cargo-release
        cargo-sweep
        cargo-tarpaulin
        cargo-udeps
        cargo-update
        cargo-watch
        cargo-web
        cargo-xbuild
        chit
        clippy
        #gir-rs
        #rls
        rust-analyzer
        rust-bindgen
        rust-cbindgen
        rustfmt
        rustup
      ];
}
