-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")
local shapes = require("deco.shapes")

-- Notification library
-- local naughty = require("naughty")
-- local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

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

-- {{{ Wibar
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ user_variables.modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ user_variables.modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Create a taglist widget
    s.workspaces = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    s.clock = wibox.widget.textclock()

    s.tray = wibox.widget.systray()

    -- Create a tasklist widget
    s.tasks = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.navbar = awful.wibox({ width = awful.screen.focused().geometry.width - (4 * beautiful.useless_gap), ontop = true, screen = s, shape = shapes.rrect })

    s.mypromptbox = awful.widget.prompt()

    -- Add widgets to the wibox
    s.navbar:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",

        -- Left widgets
        {
            layout = wibox.layout.fixed.horizontal,
            s.workspaces,
        },

        -- Middle widget
        s.mypromptbox,
        s.clock,

        -- Right widgets
        {
            layout = wibox.layout.fixed.horizontal,
            s.tray,
        },
    }
end)
-- }}}

-- Global mouse bindings
root.buttons(globalbuttons)

-- Global keyboard bindings
root.keys(globalkeys)
