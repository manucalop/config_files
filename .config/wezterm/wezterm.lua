local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 17
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 10
config.color_scheme = "Tokyo Night"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
