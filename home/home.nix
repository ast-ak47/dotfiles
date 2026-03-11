{ username, ... }:
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

	"col.active_border" = "rgba(33ccffee) rgb(00ff99ee) 45deg";
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
	"$mainMod SHIFT, Q, exec, killactive"
	"$mainMod, E, exec, $fileManager"
	"$mainMod, D, exec, $menu"

	# move focus
	"$mainMod, left, movefocous, l"
	"$mainMod, right, movefocous, r"
	"$mainMod, up, movefocous, u"
	"$mainMod, down, movefocous, d"

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
	"$mainMod, L, exec,
	  swaylock
	  --image '~/wallpaper/takemikazuchi.jpg'
	  --clock
	  --timestr '%H:%M:%S'
	  --datestr ''
	  --indicator
	  --indicator-radius 128
	  --indicator-thickness 0
	  --indicator-x-position 1600
	  --indicator-y-position 128
	  --fade-in 0.2
	  --font 'Rounded Mgen+ 1c'
	  --font-size 128
	  --ring-color 00d0aaff
	  --text-color 00d0aa
	  --text-clear-color 00d0aa
	  --text-ver-color 00d0aa
	  --text-wrong-color 00d0aa
	  --inside-color 00000000
	  --inside-clear-color 00000000
	  --inside-ver-color 00000000
	  --inside-wrong-color 00000000
	  -n
	"
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

  nixpkgs = {
    config = {
      allowUnfree = true; # Allow non-free packages
    };
  };
}
