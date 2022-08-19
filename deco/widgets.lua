local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

local w = wibox.widget {
    widget = wibox.widget.textbox,
    text = "test"
}

awful.screen.connect_for_each_screen(function(s)
    s.clock = wibox.widget.textclock()
    s.tray = wibox.widget.systray()
    s.prompt = wibox.widget {
        widget = wibox.container.background,
        bg = "ff0000",
        forced_height = 300,
        {
            widget = wibox.widget.textbox,
            text = "test",
            visible = true
        }

    }
end)