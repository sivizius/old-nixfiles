{ config, home-manager, lib, pkgs, ... }:
let
  # Keys Aliases
  mod                                   =   "Mod4";
  up                                    =   "w";
  left                                  =   "a";
  down                                  =   "s";
  right                                 =   "d";

  # Default Programs
  browser                               =   "qutebrowser";
  htop                                  =   "${config.self.terminal} -e htop";
  menu                                  =   "wofi --show drun -I --style ${./wofi.css}";
  pass                                  =   "pass -c $(bash ${./passwords.sh} | wofi --show dmenu -I --style ${./wofi.css})";
  screenshooter                         =   "bash ${./screenshooter.sh}";
  terminal                              =   "${config.self.terminal}";
  bar                                   =   "waybar -c ${./waybar/config.json} -s ${./waybar/style.css}";
  workspace3                            =   "sleep 2 && swaymsg \"workspace 3; layout tabbed\"";

  # Workspaces
  wsWebBrowser                          =   "0";
  wsFileBrowser                         =   "1";
  wsMailClient                          =   "2";
  wsMessenger                           =   "3";
  wsDevelopment                         =   "4";

  # Lock Screen
  timeOutDark                           =   120;
  timeOutLock                           =   150;
  lightsOff                             =   "swaymsg 'output * dpms off'";
  lightsOn                              =   "swaymsg 'output * dpms on'";
  lock                                  =   "swaylock -efu -c 000000 -i ${./otter.png} -s center";

  # Resize by these amounts
  resizeHeight                          =   "10px";
  resizeWidth                           =   "10px";

  # Change Brightness by this amount
  brightnessDelta                       =   "5%";

  alacritty
  =   {
        enable                          =   true;
        settings
        =   {
              font.normal
              =   {
                    family              =   "Noto Sans Mono";
                    size                =   9.0;
                  };

            colors
            =   {
                  primary
                  =   {
                        background      =   "0x000000";
                        foreground      =   "0xeaeaea";
                      };
                  normal
                  =   {
                        black           =   "0x6c6c6c";
                        red             =   "0xe9897c";
                        green           =   "0xb6e77d";
                        yellow          =   "0xecebbe";
                        blue            =   "0xa9cdeb";
                        magenta         =   "0xea96eb";
                        cyan            =   "0xc9caec";
                        white           =   "0xf2f2f2";
                      };

                bright
                =   {
                      black             =   "0x747474";
                      red               =   "0xf99286";
                      green             =   "0xc3f786";
                      yellow            =   "0xfcfbcc";
                      blue              =   "0xb6defb";
                      magenta           =   "0xfba1fb";
                      cyan              =   "0xd7d9fc";
                      white             =   "0xe2e2e2";
                    };
              };
            background_opacity          =   0.6;
          };
      };
  swayConfig
  =   {
        assigns
        =   {
              "${wsWebBrowser}"
              =   [
                    { app_id            =   "^firefox$";            }
                  ];
              "${wsFileBrowser}"
              =   [
                    { title             =   "^ranger$";             }
                  ];
              "${wsMailClient}"
              =   [
                    { title             =   "^neomutt$";            }
                  ];
              "${wsMessenger}"
              =   [
                    { app_id            =   "^telegramdesktop$";  }
                    { app_id            =   "^dino$";             }
                    { title             =   "^nheko";             }
                    { class             =   "^discord$";          }
                    { class             =   "^Mumble$";           }
                  ];
              "${wsDevelopment}"
              =   [
                    { class             =   "^Atom$";               }
                  ];
            };
        bars                            =   [ ];

        floating
        =   {
              border                    =   2;
              criteria
              =   [
                    { class             =   "^Pavucontrol$";  }
                  ];
              modifier                  =   mod;
              titlebar                  =   true;
            };

        fonts
        =   [
              "FontAwesome 10"
              "RobotoMono 10"
            ];

        input."*"
        =   {
              pointer_accel             =   "0.0";
              xkb_layout                =   "de(basic)";
              xkb_options               =   "compose:caps";
              xkb_variant               =   "\"\"";
            };

        keybindings
        =   {
              # Execute Stuff
              "${mod}+h"                =   "exec ${htop}";
              "${mod}+k"                =   "exec ${screenshooter}";
              "${mod}+l"                =   "exec ${lock}";
              "${mod}+p"                =   "exec ${pass}";
              "${mod}+t"                =   "exec ${terminal}";
              "${mod}+u"                =   "exec ${browser}";
              "${mod}+Escape"           =   "exec ${menu}";

              "${mod}+Shift+x"          =   "kill";
              "${mod}+Shift+c"          =   "reload";
              "${mod}+Shift+q"          =   "exec swaymsg exit";
              "${mod}+Shift+e"          =   "exec makoctl dismiss -a";

              # Tilling
              "${mod}+b"                =   "splith";
              "${mod}+v"                =   "splitv";

              "${mod}+q"                =   "layout stacking";
              "${mod}+e"                =   "layout tabbed";
              "${mod}+y"                =   "layout toggle split";
              "${mod}+x"                =   "fullscreen";

              "${mod}+c"                =   "floating toggle";
              "${mod}+n"                =   "focus mode_toggle";
              "${mod}+m"                =   "focus parent";
              "${mod}+f"                =   "move scratchpad";
              "${mod}+g"                =   "scratchpad show";

              # Focus
              "${mod}+${up}"            =   "focus up";
              "${mod}+Up"               =   "focus up";
              "${mod}+${left}"          =   "focus left";
              "${mod}+Left"             =   "focus left";
              "${mod}+${down}"          =   "focus down";
              "${mod}+Down"             =   "focus down";
              "${mod}+${right}"         =   "focus right";
              "${mod}+Right"            =   "focus right";

              # Moving
              "${mod}+Shift+${up}"      =   "move  up";
              "${mod}+Shift+Up"         =   "move  up";
              "${mod}+Shift+${left}"    =   "move  left";
              "${mod}+Shift+Left"       =   "move  left";
              "${mod}+Shift+${down}"    =   "move  down";
              "${mod}+Shift+Down"       =   "move  down";
              "${mod}+Shift+${right}"   =   "move  right";
              "${mod}+Shift+Right"      =   "move  right";

              # Resizing
              "${mod}+r"                =   "mode \"resize\"";

              # Workspaces
              "${mod}+F1"               =   "workspace 0";
              "${mod}+Shift+F1"         =   "move container to workspace 0";
              "${mod}+F2"               =   "workspace 1";
              "${mod}+Shift+F2"         =   "move container to workspace 1";
              "${mod}+F3"               =   "workspace 2";
              "${mod}+Shift+F3"         =   "move container to workspace 2";
              "${mod}+F4"               =   "workspace 3";
              "${mod}+Shift+F4"         =   "move container to workspace 3";
              "${mod}+F5"               =   "workspace 4";
              "${mod}+Shift+F5"         =   "move container to workspace 4";
              "${mod}+F6"               =   "workspace 5";
              "${mod}+Shift+F6"         =   "move container to workspace 5";
              "${mod}+F7"               =   "workspace 6";
              "${mod}+Shift+F7"         =   "move container to workspace 6";
              "${mod}+F8"               =   "workspace 7";
              "${mod}+Shift+F8"         =   "move container to workspace 7";
              "${mod}+F9"               =   "workspace 8";
              "${mod}+Shift+F9"         =   "move container to workspace 8";
              "${mod}+F10"              =   "workspace 9";
              "${mod}+Shift+F10"        =   "move container to workspace 9";
              "${mod}+F11"              =   "workspace a";
              "${mod}+Shift+F11"        =   "move container to workspace a";
              "${mod}+F12"              =   "workspace b";
              "${mod}+Shift+F12"        =   "move container to workspace b";
              "${mod}+1"                =   "workspace c";
              "${mod}+Shift+1"          =   "move container to workspace c";
              "${mod}+2"                =   "workspace d";
              "${mod}+Shift+2"          =   "move container to workspace d";
              "${mod}+3"                =   "workspace e";
              "${mod}+Shift+3"          =   "move container to workspace e";
              "${mod}+4"                =   "workspace f";
              "${mod}+Shift+4"          =   "move container to workspace f";
              "${mod}+5"                =   "workspace g";
              "${mod}+Shift+5"          =   "move container to workspace g";
              "${mod}+6"                =   "workspace h";
              "${mod}+Shift+6"          =   "move container to workspace h";
              "${mod}+7"                =   "workspace i";
              "${mod}+Shift+7"          =   "move container to workspace i";
              "${mod}+8"                =   "workspace j";
              "${mod}+Shift+8"          =   "move container to workspace j";
              "${mod}+9"                =   "workspace k";
              "${mod}+Shift+9"          =   "move container to workspace k";
              "${mod}+0"                =   "workspace l";
              "${mod}+Shift+0"          =   "move container to workspace l";

              # Special Keys
              "XF86AudioRaiseVolume"    =   "exec pactl set-sink-volume @DEFAULT_SINK@    +${brightnessDelta}";
              "XF86AudioLowerVolume"    =   "exec pactl set-sink-volume @DEFAULT_SINK@    -${brightnessDelta}";
              "XF86AudioMute"           =   "exec pactl set-sink-mute   @DEFAULT_SINK@    toggle";
              "XF86AudioMicMute"        =   "exec pactl set-source-mute @DEFAULT_SOURCE@  toggle";
              "XF86MonBrightnessDown"   =   "exec brightnessctl set ${brightnessDelta}-";
              "XF86MonBrightnessUp"     =   "exec brightnessctl set +${brightnessDelta}";
              "XF86AudioPlay"           =   "exec playerctl play-pause";
              "XF86AudioNext"           =   "exec playerctl next";
              "XF86AudioPrev"           =   "exec playerctl previous";

              # Keyboard Layout
              "Ctrl+Shift+F1"           =   "input * xkb_layout de(basic)";
              "Ctrl+Shift+F2"           =   "input * xkb_layout il(phonetic)";
              "Ctrl+Shift+F3"           =   "input * xkb_layout bg(phonetic)";
              "Ctrl+Shift+F4"           =   "input * xkb_layout gr(basic)";
              "Ctrl+Shift+F5"           =   "input * xkb_layout us(basic)";
            };

        modes
        =   {
              "resize"
              =   {
                    "Return"            =   "mode \"default\"";
                    "Escape"            =   "mode \"default\"";
                    "${up}"             =   "resize shrink height  ${resizeHeight}";
                    "Up"                =   "resize shrink height  ${resizeHeight}";
                    "${left}"           =   "resize shrink width   ${resizeWidth}";
                    "Left"              =   "resize shrink width   ${resizeWidth}";
                    "${down}"           =   "resize grow   height  ${resizeHeight}";
                    "Down"              =   "resize grow   height  ${resizeHeight}";
                    "${right}"          =   "resize grow   width   ${resizeWidth}";
                    "Right"             =   "resize grow   width   ${resizeWidth}";
                  };
            };

        output."*".bg               =   "\"${./Crater_Cluster.png}\" fill";

        startup
        =   [
              { command = "atom";                                 always  = false;  }
              { command = "dino";                                 always  = false;  }
              { command = "Discord";                              always  = false;  }
              { command = "firefox";                              always  = false;  }
              ##{ command = "mako     -c ~/.config/makorc";         always  = false;  }
              { command = "nheko";                                always  = false;  }
              { command = "telegram-desktop";                     always  = false;  }
              { command = "${terminal}  -t neomutt  -e neomutt";  always  = false;  }
              { command = "${terminal}  -t ranger   -e ranger";   always  = false;  }
              { command = "${bar}";                               always  = false;  }
              { command = "${workspace3}";                        always  = true;   }
            ];

        window
        =   {
              border                    =   2;
              commands                  =   [ ];
              hideEdgeBorders           =   "both";
              titlebar                  =   false;
            };

        workspaceAutoBackAndForth       =   true;
      };
in
  {
    environment
    =   {
          systemPackages
          =   with pkgs;
              [
                grim
                orca
                pass-wayland
                slurp
                swaybg
                swayidle
                swaylock
                waybar
                wdisplays
                wev
                wl-clipboard
                wofi
                (
                  wofi.overrideAttrs
                  (
                    oldAttrs:
                    {
                      # Remove the do_not_follow_symlinks-patch
                      patches           =   [];
                    }
                  )
                )
              ];
        };

    hardware.opengl.enable              =   true;

    home-manager.users."${config.self.userName}"
    =   {
          home.file
          =   {
                ".local/bin/mediaplayer.py"
                =   {
                      source            =   ./waybar/mediaplayer.py;
                    };
              };
          programs
          =   {
                inherit alacritty;
                mako
                =   {
                      enable            =   true;
                      backgroundColor   =   "#00000070";
                      borderColor       =   "#ffffffff";
                      defaultTimeout    =   16000;
                      font              =   "pango:\"Font Awesome 5 Free 100\",RobotoMono10,NotoColorEmoji10";
                      maxVisible        =   2;
                      sort              =   "-time";
                      textColor         =   "#ffffffff";
                    };
            };
          services.redshift
          =   {
                enable                  =   true;
                package
                =   pkgs.redshift.overrideAttrs
                    (
                      oldAttrs:
                      {
                        src
                        =   pkgs.fetchFromGitHub
                            {
                              owner     =   "minus7";
                              repo      =   "redshift";
                              rev       =   "eecbfedac48f827e96ad5e151de8f41f6cd3af66";
                              sha256    =   "0rs9bxxrw4wscf4a8yl776a8g880m5gcm75q06yx2cn3lw2b7v22";
                            };
                      }
                    );
                tray                    =   true;
                latitude                =   "50.85";
                longitude               =   "12.95";
              };
          wayland.windowManager.sway
          =   {
                enable                  =   true;
                config                  =   swayConfig;
                extraSessionCommands
                =   ''
                      export SDL_VIDEODRIVER=wayland
                      export QT_QPA_PLATFORM=wayland
                      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
                      export _JAVA_AWT_WM_NONREPARENTING=1
                    '';
              };
        };
    systemd.user.services.screenlock
    =   {
          enable                        =   true;
          description                   =   "Lock the screen";
          after                         =   [ "graphical-session-pre.target" ];
          partOf                        =   [ "graphical-session.target" ];
          wantedBy                      =   [ "graphical-session.target" ];
          serviceConfig
          =   {
                ExecStart
                =   lib.concatStringsSep " "
                    [
                      "swayidle -w"
                      "timeout"       "\"${toString timeOutLock}\"" "\"${lightsOff}; ${lock}\""
                      "resume"        "\"${lightsOn}\""
                      "before-sleep"  "\"${lock}\""
                      "after-sleep"   "\"${lightsOn}\""
                      "lock"          "\"${lock}\""
                    ];
                RestartSec              =   3;
                Restart                 =   "always";
              };
        };
  }
