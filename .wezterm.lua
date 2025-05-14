local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'OneHalfDark'
config.enable_scroll_bar = true
config.exit_behavior = "CloseOnCleanExit"
config.font = wezterm.font 'JetBrains Mono'

config.default_domain = 'WSL:Ubuntu'

config.keys = {
    {
        key = 'c',
        mods = 'CTRL',
        action = wezterm.action_callback(function(window, pane)
            local selection_text = window:get_selection_text_for_pane(pane)
            local is_selection_active = string.len(selection_text) ~= 0
            if is_selection_active then
                window:perform_action(wezterm.action.CopyTo('ClipboardAndPrimarySelection'), pane)
            else
                window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
            end
        end),
    },
    {
        key = 'v',
        mods = 'CTRL',
        action = wezterm.action_callback(function(window, pane)
            window:perform_action(wezterm.action.PasteFrom('Clipboard'), pane)
        end)
    },
    {
        key = 'h',
        mods = 'ALT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        key = 's',
        mods = 'ALT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        key = 'c',
        mods = 'ALT',
        action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
        key = 'n',
        mods = 'ALT',
        action = wezterm.action.SpawnTab { DomainName = config.default_domain }
    },
    {
        key = "p",
        mods = "ALT",
        action = wezterm.action { PaneSelect = { alphabet = "1234567890" } }
    },
    {
        key = "F11",
        mods= "",
        action = wezterm.action.ToggleFullScreen,
    }
}

return config