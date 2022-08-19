-- Standard awesome library
local awful = require("awful")
local wibox = require("wibox")

-- Autofocus
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

-- Rice
require("deco.wallpaper")
require("deco.taglist")
require("deco.tasklist")
require("deco.statusbar")
require("deco.widgets")

-- Global mouse bindings
root.buttons(require("binding.globalbuttons"))

-- Global keyboard bindings
root.keys(require("binding.globalkeys"))
