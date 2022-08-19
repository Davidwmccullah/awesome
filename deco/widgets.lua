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
    s.prompt = awful.widget.prompt {
        prompt = "<b>Spotify Shell</b>: ",
        bg_cursor = '#84bd00',
        textbox = awful.widget.prompt,
        exe_callback = function(input_text)
            w.visible = true
            -- if not input_text or #input_text == 0 then return end
            -- awful.spawn("sp " .. input_text)
        end,
        done_callback = function()
            w.visible = false
        end
    }
end)