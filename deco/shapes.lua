local gears = require("gears")

local shapes = {
    rrect = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, 8)
    end
}

return shapes