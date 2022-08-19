local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shapes = require("deco.shapes")

awful.screen.connect_for_each_screen(function(s)
    -- Create the wibox
    s.statusbar = awful.wibox({ width = awful.screen.focused().geometry.width - (4 * beautiful.useless_gap), ontop = true, screen = s, shape = shapes.rrect })

    -- Add widgets to the wibox
    s.statusbar:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",

        -- Left widgets
        {
            layout = wibox.layout.fixed.horizontal,
            s.taglist,
        },

        -- Middle widget
        s.prompt,
        s.clock,

        -- Right widgets
        {
            layout = wibox.layout.fixed.horizontal,
            s.tray,
        },
    }
end)