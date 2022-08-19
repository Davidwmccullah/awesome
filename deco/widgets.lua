local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

awful.screen.connect_for_each_screen(function(s)
    s.clock = wibox.widget.textclock()
    s.tray = wibox.widget.systray()
    s.prompt = awful.widget.prompt.run {
        prompt = "<b>Spotify Shell</b>: ",
        bg_cursor = '#84bd00',
        textbox = wibox.widget {
            widget = wibox.widget.textbox,
            text = "test"
        },
        exe_callback = function(input_text)
            if not input_text or #input_text == 0 then return end
            awful.spawn("sp " .. input_text)
        end,
        done_callback = function(p)
            p.visible = false
        end
    }
end)