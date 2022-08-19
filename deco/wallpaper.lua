local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

awful.screen.connect_for_each_screen(function(s)
    if beautiful.wallpaper then
        -- If wallpaper is a function, call it with the screen
        if type(beautiful.wallpaper) == "function" then
            beautiful.wallpaper = wallpaper(s)
        end

        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end)