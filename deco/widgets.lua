local awful = require("awful")
local wibox = require("wibox")

awful.screen.connect_for_each_screen(function(s)
    s.clock = wibox.widget.textclock()
    s.tray = wibox.widget.systray()
    s.prompt = awful.widget.prompt()
end)