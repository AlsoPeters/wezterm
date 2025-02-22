-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
-- This is where you actually apply your config choices

--[ Color Scheme ]--
config.color_scheme = "Tokyo Night"

--[ Font ]--
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" })
config.font_size = 16

-- Font rules
config.font_rules = {
	{
		italic = true,
		font = wezterm.font("FiraCode Nerd Font"),
	},
}

--[ Tab Bar ]--
-- config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
-- config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.8, }

--[ Default Program ]--
config.default_prog = {
	"wsl.exe",
	"--cd",
	"~",
	"zsh",
	"-l",
}

--[ Lauch Menu ]--

config.launch_menu = {
	{
		label = "Bash => Windows",
		args = { "bash.exe" },
	},
	{
		label = "PowerShell",
		args = { "powershell.exe" },
	},
	{
		label = "CMD",
		args = { "cmd.exe" },
	},
}

--[ Keybindings ]--
config.keys = {
	-- Open a new tab with Ctrl+T
	{ key = "t", mods = "CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	-- Open Launcher Menu
	{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },
	-- Split pane vertically with Ctrl+|
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Split pane horizontally with Ctrl+-
	{ key = "+", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Switch between panes with Alt+ArrowKeys
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

	-- Close a tab with Ctrl+W
	{ key = "w", mods = "CTRL", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
}

return config
