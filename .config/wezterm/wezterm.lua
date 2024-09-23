local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = "tokyonight"
config.font = wezterm.font_with_fallback {
  { family = "Iosevka Nerd Font", weight = "Regular" },
  { family = "Symbols Nerd Font Mono", scale = 0.80 },
  'Noto Color Emoji',
}
config.font_size = 14
config.enable_scroll_bar = false
-- config.enable_tab_bar = false

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.use_cap_height_to_scale_fallback_fonts = true

config.window_decorations = "NONE"

config.default_prog = { "tmux" }

return config
