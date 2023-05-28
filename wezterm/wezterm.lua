local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.window_background_opacity = 0.8
config.cell_width = 0.9
config.color_scheme = 'Afterglow'
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.keys = {
    { key = '1', mods = 'CTRL', action = act.ActivateTab(0) },
    { key = '2', mods = 'CTRL', action = act.ActivateTab(1) },
    { key = '3', mods = 'CTRL', action = act.ActivateTab(2) },
    { key = '4', mods = 'CTRL', action = act.ActivateTab(3) },
    { key = '5', mods = 'CTRL', action = act.ActivateTab(4) },
    { key = '6', mods = 'CTRL', action = act.ActivateTab(5) },
    { key = '7', mods = 'CTRL', action = act.ActivateTab(6) },
    { key = '8', mods = 'CTRL', action = act.ActivateTab(7) },
    { key = '9', mods = 'CTRL', action = act.ActivateTab(8) },
}

config.colors = {
  foreground = 'silver',
  background = 'black',
}

return config
