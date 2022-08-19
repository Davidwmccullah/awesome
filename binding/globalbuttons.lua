local awful = require("awful")
local gears = require("gears")
local menu = require("main.menu")

local globalbuttons = gears.table.join(
    awful.button({ }, 3, function () menu.menu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
)

return globalbuttons