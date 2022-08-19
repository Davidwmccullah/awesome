-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")
local shapes = require("deco.shapes")

-- Notification library
-- local naughty = require("naughty")
-- local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Error handling
require("main.error-handling")

-- User variables
local user_variables = require("main.user-variables")

-- Main config
local layouts = require("main.layouts")
local tags = require("main.tags")
local menu = require("main.menu")
local rules = require("main.rules")
local signals = require("main.signals")

-- Global bindings
local globalkeys = require("binding.globalkeys")
local globalbuttons = require("binding.globalbuttons")

-- Wallpaper
local wallpaper = require("deco.wallpaper")

-- {{{ Wibar
-- Create a wibox for each screen and add it






awful.screen.connect_for_each_screen(function(s)
    s.clock = wibox.widget.textclock()

    s.tray = wibox.widget.systray()



    -- Create the wibox
    s.navbar = awful.wibox({ width = awful.screen.focused().geometry.width - (4 * beautiful.useless_gap), ontop = true, screen = s, shape = shapes.rrect })

    s.mypromptbox = awful.widget.prompt()

    -- Add widgets to the wibox
    s.navbar:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",

        -- Left widgets
        {
            layout = wibox.layout.fixed.horizontal,
            s.taglist,
        },

        -- Middle widget
        s.mypromptbox,
        s.clock,

        -- Right widgets
        {
            layout = wibox.layout.fixed.horizontal,
            s.tray,
        },
    }
end)
-- }}}

-- Global mouse bindings
root.buttons(globalbuttons)

-- Global keyboard bindings
root.keys(globalkeys)
