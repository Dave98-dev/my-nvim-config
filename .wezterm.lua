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
    },
    {
        key = 'LeftArrow',
        mods = 'ALT',
        action = wezterm.action.EmitEvent 'switch-to-left',
    },
    {
        key = 'DownArrow',
        mods = 'ALT',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'UpArrow',
        mods = 'ALT',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'RightArrow',
        mods = 'ALT',
        action = wezterm.action.EmitEvent 'switch-to-right',
    },
}

-- alt da 1 a 8 per navigare i tab(se mi servono più di 5 tab sto sbagliando qualcosa)
for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

wezterm.on('switch-to-left', function(window, pane)
    local tab = window:mux_window():active_tab()

    if tab:get_pane_direction 'Left' ~= nil then
        window:perform_action(wezterm.action.ActivatePaneDirection 'Left', pane)
    else
        window:perform_action(wezterm.action.ActivateTabRelative(-1), pane)
    end
end)

wezterm.on('switch-to-right', function(window, pane)
    local tab = window:mux_window():active_tab()

    if tab:get_pane_direction 'Right' ~= nil then
        window:perform_action(
            wezterm.action.ActivatePaneDirection 'Right',
            pane
        )
    else
        window:perform_action(wezterm.action.ActivateTabRelative(1), pane)
    end
end)

return config