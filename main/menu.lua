local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local user_variables = require("main.user_variables")

local menu = awful.menu({ items = { { "open terminal", user_variables.terminal },
                                    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
                                    { "restart", awesome.restart },
                                    { "quit", function() awesome.quit() end },
                                }
                        })

-- Menubar configuration
menubar.utils.terminal = user_variables.terminal -- Set the terminal for applications that require it
-- }}}

return menu