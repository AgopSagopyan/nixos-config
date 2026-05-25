{ ... }:

{
  programs.waybar = {
    enable = true;
    style = ''
          /* --- Global Styles --- */
      * {
          font-family: "JetBrains Mono Nerd Font", "Roboto", sans-serif;
          font-size: 13px;
          border: none;
          border-radius: 0;
      }

      window#waybar {
          background-color: #000000;
          border-bottom: 1px solid #222222; /* Subtle separator */
          color: #ffffff;
          transition-property: background-color;
          transition-duration: .5s;
      }

      /* --- Modules Positioning --- */
      #workspaces button {
          padding: 0 5px;
          background-color: transparent;
          color: #555555; /* Dimmed inactive workspaces */
      }

      #workspaces button.active {
          color: #ffffff;
          border-bottom: 2px solid #ffffff;
      }

      #workspaces button.focused {
          background-color: #111111;
          color: #ffffff;
      }

      #workspaces button:hover {
          background: rgba(255, 255, 255, 0.1);
          box-shadow: inherit;
          text-shadow: inherit;
      }

      /* --- Individual Module Styling --- */
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
          padding: 0 10px;
          color: #ffffff;
          background-color: #000000;
      }

      /* Specific Accents */
      #clock {
          font-weight: bold;
      }

      #battery.critical:not(.charging) {
          background-color: #ff0000;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #network.disconnected {
          color: #444444;
      }

      #pulseaudio.muted {
          color: #444444;
      }

      /* --- Tray / System Icons --- */
      #tray {
          padding-left: 15px;
      }

      /* --- Tooltips --- */
      tooltip {
          background: #0a0a0a;
          border: 1px solid #333333;
      }

      tooltip label {
          color: #ffffff;
      }
    '';
    settings = {
      mainBar = {
        # General Settings
        height = 1080;
        width = 15;
        spacing = 4;

        position = "left";
        exclusive = "true";
        layer = "top";

        # Module Layout
        modules-left = [
          #"sway/workspaces"
          #"sway/mode"
          #"sway/scratchpad"
          #"custom/media"
          #"hyprland/workspaces"
          "niri/workspaces"
        ];

        modules-center = [
          "sway/window"
          "hyprland/window"
          "niri/window"
        ];

        modules-right = [
          "clock"
          #"temperature"
          #"cpu"
          #"disk"
        ];

        # Module Configurations
        "hyprland/workspaces" = {
          format = "{icon}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "keyboard-state" = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "Locked";
            unlocked = "Unlocked";
          };
        };

        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };

        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [
            ""
            ""
          ];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };

        "mpd" = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 5;
          consume-icons.on = " ";
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons.on = " ";
          single-icons.on = "1 ";
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        "tray" = {
          spacing = 10;
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        "cpu" = {
          format = "{usage}% ";
          tooltip = false;
        };

        "memory" = {
          format = "{}% ";
        };

        "temperature" = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };

        "backlight" = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };

        "network" = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };

        "custom/media" = {
          format = "{icon} {text}";
          return-type = "json";
          max-length = 40;
          format-icons = {
            spotify = "";
            default = "🎜";
          };
          escape = true;
          exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
        };

        "custom/power" = {
          format = "⏻ ";
          tooltip = false;
          menu = "on-click";
          menu-file = "$HOME/.config/waybar/power_menu.xml";
          menu-actions = {
            shutdown = "shutdown";
            reboot = "reboot";
            suspend = "systemctl suspend";
            hibernate = "systemctl hibernate";
          };
        };
      };
    };
  };
}
