local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shapes = require("deco.shapes")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi


awful.screen.connect_for_each_screen(function(s)
    s.wiboxpadding = awful.wibox {
        height = dpi(beautiful.useless_gap),
        opacity = 0
    }

    s.statusbar = awful.wibox {
        width = awful.screen.focused().geometry.width - (2 * dpi(beautiful.useless_gap)),
        ontop = true,
        screen = s,
        shape = shapes.rrect,
        widget = wibox.widget {
            layout = wibox.layout.align.horizontal,
            expand = "none",
    
            -- Left widgets
            {
                layout = wibox.layout.fixed.horizontal,
                s.taglist,
            },
    
            -- Middle widget
            -- s.prompt,
            s.clock,
    
            -- Right widgets
            {
                layout = wibox.layout.fixed.horizontal,
                s.tray,
            }
        }
    }
end)