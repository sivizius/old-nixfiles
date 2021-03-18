{ pkgs, ... }:
{
  environment.systemPackages
  =   with pkgs;
      [
        # audio
        audacity
        pavucontrol

        # documents
        cairo
        evince
        libreoffice
        pandoc
        pdfpc
        pdftk
        poppler_utils
        qpdf
        texlive.combined.scheme-full

        # images
        feh
        gimp
        imagemagick
        inkscape
        librsvg

        # video
        ffmpeg
        mpv
      ];
}
