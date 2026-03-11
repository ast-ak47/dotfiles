local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'OneDark (base16)'

config.window_background_opacity = 0.85

config.font = wezterm.font("HackGen Console NF", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 16

config.use_ime = true

config.enable_wayland = false

return config
