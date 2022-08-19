local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

awful.screen.connect_for_each_screen(function(s)
    s.clock = wibox.widget.textclock()
    s.tray = wibox.widget.systray()
    s.prompt = awful.popup {
        widget = {
            widget  = wibox.container.margin,
            margin = 2 * beautiful.useless_gap,
            {
                widget = wibox.widget.background,
                {
                    text   = 'foobar',
                    widget = wibox.widget.textbox
                }
            }   
        }
    }
end)