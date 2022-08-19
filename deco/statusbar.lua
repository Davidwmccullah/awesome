local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local shapes = require("deco.shapes")

awful.screen.connect_for_each_screen(function(s)
    -- s.wiboxpadding = awful.wibox {
    --     height = 2 * beautiful.useless_gap,
    --     opacity = 0,
    -- }

    s.statusbar = awful.wibox {
        -- width = awful.screen.focused().geometry.width - (4 * beautiful.useless_gap),
        height = 4 * beautiful.useless_gap,
        ontop = true,
        screen = s,
        shape = shapes.rrect,
        bg = "#00000000",
        widget = wibox.widget {
            -- Margins
            widget = wibox.container.margin,
            top = 2 * beautiful.useless_gap,
            left = 2 * beautiful.useless_gap,
            right = 2 * beautiful.useless_gap,
            {
                -- Color / Shape
                widget = wibox.container.background,
                bg = beautiful.bg_normal,
                shape = shapes.rrect,
                shape_border_width = beautiful.border_width,
                shape_border_color = beautiful.border_color,
                {     
                    layout = wibox.layout.align.horizontal,
                    expand = "none",
            
                    -- Left widgets
                    {
                        layout = wibox.layout.fixed.horizontal,
                        s.taglist,
                    },
            
                    -- Middle widget
                    s.clock,
            
                    -- Right widgets
                    {
                        layout = wibox.layout.fixed.horizontal,
                        s.tray,
                    }
                }
                
            }
        }
    }
end)