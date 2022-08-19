local awful = require("awful")

-- Each screen has its own tag table.
awful.connect_for_each_screen(function(s)
    awful.tag({ "1", "2", "3", "4", "5"}, s, awful.layout.layouts[1])
end)