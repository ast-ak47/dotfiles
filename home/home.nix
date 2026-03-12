{ config, username, ... }:
{
  imports = [
    ./apps.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    # Using nixpkgs-unstable, so the release check is disabled to suppress version mismatch warnings
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
  };

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "DP-1, 1920x1080@60, 0x0, 1"
	"DP-2, 1920x1080@144, -1920x0, 1"
      ];

      general = {
        gaps_in = 5;
	gaps_out = 20;

	border_size = 2;

	"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
	"col.inactive_border" = "rgba(595959aa)";

	resize_on_border = false;

	allow_tearing = false;

	layout = "dwindle";
      };

      decoration = {
        rounding = 0;
	rounding_power = 0;
	active_opacity = 1.0;
	inactive_opacity = 1.0;

	shadow = {
	  enabled = false;
	};

	blur = {
	  enabled = true;
	  size = 3;
	  passes = 1;

	  vibrancy = 0.1696;
	};
      };

      animations = {
        enabled = true;
        bezier = [
	  "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1.0"
          "quick, 0.15, 0, 0.1, 1"
	];

	animation = [
	  "global, 1, 10, default"
	  "border, 1, 5.39, easeOutQuint"
	  "windows, 1, 4.79, easeOutQuint"
	  "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
	];

      };

      dwindle = {
        pseudotile = true;
	preserve_split = true;
      };

      input = {
        kb_layout = "jp";
	kb_model = "jp106";
      };

      master = {
        new_status = "slave";
      };

      xwayland = {
        force_zero_scaling = true;
      };

      "$mainMod" = "SUPER";
      "$terminal" = "wezterm";
      "$fileManager" = "pcmanfm";
      "$menu" = "rofi -show combi";

      bind = [
        "$mainMod, Return, exec, $terminal"
	"$mainMod SHIFT, Q, killactive"
	"$mainMod, E, exec, $fileManager"
	"$mainMod, D, exec, $menu"

	# move focus
	"$mainMod, left, movefocus, l"
	"$mainMod, right, movefocus, r"
	"$mainMod, up, movefocus, u"
	"$mainMod, down, movefocus, d"

	# switch workspaces
	"$mainMod, 1, workspace, 1"
	"$mainMod, 2, workspace, 2"
	"$mainMod, 3, workspace, 3"
	"$mainMod, 4, workspace, 4"
	"$mainMod, 5, workspace, 5"
	"$mainMod, 6, workspace, 6"
	"$mainMod, 7, workspace, 7"
	"$mainMod, 8, workspace, 8"
	"$mainMod, 9, workspace, 9"
	"$mainMod, 0, workspace, 10"
	"$mainMod, mouse_down, workspace, m+1"
	"$mainMod, mouse_up, workspace, m-1"

	# move active window to a workspace
	"$mainMod SHIFT, 1, movetoworkspace, 1"
	"$mainMod SHIFT, 2, movetoworkspace, 2"
	"$mainMod SHIFT, 3, movetoworkspace, 3"
	"$mainMod SHIFT, 4, movetoworkspace, 4"
	"$mainMod SHIFT, 5, movetoworkspace, 5"
	"$mainMod SHIFT, 6, movetoworkspace, 6"
	"$mainMod SHIFT, 7, movetoworkspace, 7"
	"$mainMod SHIFT, 8, movetoworkspace, 8"
	"$mainMod SHIFT, 9, movetoworkspace, 9"
	"$mainMod SHIFT, 0, movetoworkspace, 10"

        # Screen Shot (provided by hyprshot)
	", Print, exec, hyprshot -m window --clipboard-only"
	"$mainMod SHIFT, S, exec, hyprshot -m region --clipboard-only"

        # Extraordinary swaylock command
	"$mainMod, L, exec, swaylock --image ${./wallpaper/wallpaper.png} --clock --timestr '%H:%M:%S' --datestr '' --indicator --indicator-radius 128 --indicator-thickness 0 --indicator-x-position 1600 --indicator-y-position 128 --fade-in 0.2 --font 'Rounded Mgen+ 1c' --font-size 128 --ring-color 00d0aaff --text-color 00d0aa --text-clear-color 00d0aa --text-ver-color 00d0aa --text-wrong-color 00d0aa --inside-color 00000000 --inside-clear-color 00000000 --inside-ver-color 00000000 --inside-wrong-color 00000000 -n"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
	"$mainMod, mouse:273, resizewindow"
      ];

      exec-once = [
        "blueman-applet"
        "discord --start-minimized" 
        "fcitx5 -D"
        "gammastep-indicator -l 35:139"
	"hyprpaper"
        "nm-applet"
	"systemctl --user start hyprpolkitagent"
	"waybar"
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        {
          monitor = "DP-1";
	  path = "${./wallpaper/wallpaper.png}";
	  fit_mode = "cover";
        }
        {
          monitor = "DP-2";
	  path = "${./wallpaper/wallpaper.png}";
	  fit_mode = "cover";
        }
      ];
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
		position = "top";
		height = 24;
		
		modules-left = [
		"hyprland/workspaces"
		"hyprland/window"
		"cpu"
		"memory"
		"disk"
		];

		modules-center = [];

		modules-right = [
		"tray"
		"pulseaudio"
		"clock"
		];

		"hyprland/workspaces" = {
		format = "{icon}";
		on-scroll-up = "hyprctl dispatch workspace m+1";
		on-scroll-down = "hyprctl dispatch workspace m-1";
		};

		"hyprland/window" = {
		max-length = 200;
		separate-outputs = true;
		};

		"tray" = {
		icon_size = 16;
		spacing = 10;
		};

		"clock" = {
		interval = 1;
		format = "{:%m/%d(%a) %T}";
		};

		"cpu" = {
		format = " {usage}%";
		tooltip = false;
		};

		"memory" = {
			format = " {percentage}%";
		};

		"disk" = {
			format = " {percentage_used}%";
		};

		"pulseaudio" = {
			format = " {icon} {volume}% {format_source}";
			format-bluetooth = "{icon} {volume}% {format_source}";
			format-bluetooth-muted = " {icon} {format_source}";
			format-muted = " {format_source}";
			format-source = " {volume}%";
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
	  };
	};

    style = ''
        @define-color bg #282e34;
        @define-color char #ffffff;

        * {
			border: none;
			border-radius: 15px;
			min-height: 0;
			margin: 0.15em 0.2em;
		}

		#waybar {
			font-family: FontAwesome, 'Rounded Mgen+ 1c', sans-serif;
			font-size: 16px;
		}

		window#waybar {
			background-color: rgba(0, 0, 0, 0.0);
			border-bottom: 3px solid rgba(0, 0, 0, 0.0);
			color: @char;
			transition-property: background-color;
			transition-duration: .5s;
		}

		window#waybar.hidden {
			opacity: 0.2;
		}

		/*
		window#waybar.empty {
			background-color: @bg;
		}
		window#waybar.solo {
			background-color: @bg;

		*/

		window#waybar.termite {
			background-color: @bg;
		}

		window#waybar.chromium {
			background-color: @bg;
			border: none;
		}

		button {
			/* Use box-shadow instead of border so the text isn't offset */
			box-shadow: inset 0 -3px transparent;
			/* Avoid rounded borders under each button name */
			border: none;
			border-radius: 0;
		}

		/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
		button:hover {
			background: @bg;
			box-shadow: inset 0 -3px #ffffff;
		}

		#workspaces button {
			padding: 0 5px;
			background-color: @bg;
			color: @char;
			border-radius: 20px;
		}

		#workspaces button:hover {
			background: @bg;
		}

		#workspaces button.focused {
			background-color: @bg;
			box-shadow: inset 0 -3px #ffffff;
		}

		#workspaces button.urgent {
			background-color: @bg;
		}

		#mode {
			background-color: @bg;
			border-bottom: 3px solid #ffffff;
		}

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
		#custom-pacman,
		#custom-powermenu,
		#tray,
		#mode,
		#idle_inhibitor,
		#scratchpad,
		#mpd {
			padding: 0 10px;
			color: @char;
		}

		#window {
			padding: 0 10px;
			background-color: @bg;
			color: @char;
			border-radius: 20px;
		}

		#workspaces {
			margin: 0 4px;
		}

		/* If workspaces is the leftmost module, omit left margin */
		.modules-left > widget:first-child > #workspaces {
			margin-left: 0;
		}

		/* If workspaces is the rightmost module, omit right margin */
		.modules-right > widget:last-child > #workspaces {
			margin-right: 0;
		}

		#clock {
			background-color: @bg;
		}

		#battery {
			background-color: @bg;
			color: @char;
		}

		#battery.charging, #battery.plugged {
			color: @char;
			background-color: @bg;
		}

		@keyframes blink {
			to {
				background-color: @bg;
				color: @char;
			}
		}

		#battery.critical:not(.charging) {
			background-color: @bg;
			color: #ffffff;
			animation-name: blink;
			animation-duration: 0.5s;
			animation-timing-function: linear;
			animation-iteration-count: infinite;
			animation-direction: alternate;
		}

		label:focus {
			background-color: @bg;
		}

		#cpu {
			background-color: @bg;
			color: #ffffff;
		}

		#memory {
			background-color: @bg;
		}

		#disk {
			background-color: @bg;
		}

		#backlight {
			background-color: @bg;
		}

		#network {
			background-color: @bg;
		}

		#network.disconnected {
			background-color: @bg;
		}

		#pulseaudio {
			background-color: @bg;
			color: @char;
		}

		#pulseaudio.muted {
			background-color: @bg;
			color: @char;
		}

		#wireplumber {
			background-color: @bg;
			color: #000000;
		}

		#wireplumber.muted {
			background-color: @bg;
		}

		#custom-media {
			background-color: @bg;
			color: #2a5c45;
			min-width: 100px;
		}

		#custom-media.custom-spotify {
			background-color: @bg;
		}

		#custom-media.custom-vlc {
			background-color: @bg;
		}

		#temperature {
			background-color: @bg;
		}

		#temperature.critical {
			background-color: @bg;
		}

		#tray {
			background-color: @bg;
		}

		#tray > .passive {
			-gtk-icon-effect: dim;
		}

		#tray > .needs-attention {
			-gtk-icon-effect: highlight;
			background-color: @bg;
		}

		#idle_inhibitor {
			background-color: @bg;
		}

		#idle_inhibitor.activated {
			background-color: @bg;
			color: #2d3436;
		}

		#mpd {
			background-color: @bg;
			color: @char;
		}

		#mpd.disconnected {
			background-color: @bg;
		}

		#mpd.stopped {
			background-color: @bg;
		}

		#mpd.paused {
			background-color: @bg;
		}

		#language {
			background: @bg;
			color: #740864;
			padding: 0 5px;
			margin: 0 5px;
			min-width: 16px;
		}

		#keyboard-state {
			background: @bg;
			color: @char;
			padding: 0 0px;
			margin: 0 5px;
			min-width: 16px;
		}

		#keyboard-state > label {
			padding: 0 5px;
		}

		#keyboard-state > label.locked {
			background: @bg;
		}

		#scratchpad {
			background: @bg;
		}

		#scratchpad.empty {
			background-color: @bg;
		}

		#privacy {
			padding: 0;
		}

		#privacy-item {
			padding: 0 5px;
			color: white;
		}

		#privacy-item.screenshare {
			background-color: @bg;
		}

		#privacy-item.audio-in {
			background-color: @bg;
		}

		#privacy-item.audio-out {
			background-color: @bg;
		}

		#custom-powermenu {
			background-color: @bg;
			color: @char;
		}
	'';
  };

  programs.rofi = {
    enable = true;
    font = "Rounded Mgen+ 1c 12";
    extraConfig = {
      modi = "drun,run,window";
      combi-modi = "drun,run,window";
      show-icons = true;
    };
    theme = let 
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        background-color = mkLiteral "#282C33";
        border-color = mkLiteral "#2e343f";
        text-color = mkLiteral "#8ca0aa";
        spacing = 0;
        width = 512;
      };
      "#inputbar" = {
        border = mkLiteral "0 0 1px 0";
	children = map mkLiteral [ "prompt" "entry" ];
      };
      "#prompt" = {
        padding = mkLiteral "16px";
	border = mkLiteral "0 1px 0 0";
      };
      "textbox" = {
        background-color = mkLiteral "#2e343f";
        border = mkLiteral "0 0 1px 0";
    	border-color = mkLiteral "#282C33";
    	padding = mkLiteral "8px 16px";
      };
      "#entry" = {
        padding = mkLiteral "16px";
      };
      "#listview" = {
        margin = mkLiteral "0 0 -1px 0";
	scrollbar = false;
      };
      "#element" = {
        border = mkLiteral "0 0 1px 0";
	padding = mkLiteral "8px";
      };
      "#element selected" = {
        background-color = mkLiteral "#2e343f";
      };
      "#element-text" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
	padding = mkLiteral "0 0 0 8px";
      };
      "#element-icon" = {
        size = 24;
	background-color = mkLiteral "inherit";
      };
    };
  };

  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./config/wezterm/wezterm.lua;
  };

  nixpkgs = {
    config = {
      allowUnfree = true; # Allow non-free packages
    };
  };
}
