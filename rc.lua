-- Standard awesome library
-- local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Error handling
require("main.error-handling")

-- User variables
local user_variables = require("main.user-variables")

-- Main config
local layouts = require("main.layouts")
local tags = require("main.tags")
local menu = require("main.menu")
local rules = require("main.rules")
local signals = require("main.signals")

-- Global bindings
local globalkeys = require("binding.globalkeys")
local globalbuttons = require("binding.globalbuttons")

-- Rice
require("deco.wallpaper")
require("deco.taglist")
require("deco.tasklist")
require("deco.statusbar")

awful.screen.connect_for_each_screen(function(s)
    s.clock = wibox.widget.textclock()
    s.tray = wibox.widget.systray()
    s.mypromptbox = awful.widget.prompt()
end)
-- }}}

-- Global mouse bindings
root.buttons(globalbuttons)

-- Global keyboard bindings
root.keys(globalkeys)
