-- Variable definitions
local user_variables = {
    -- Themes define colours, icons, font and wallpapers.
    beautiful.init("~/.config/awesome/theme.lua")

    -- This is used later as the default terminal and editor to run.
    terminal = "alacritty"
    editor = "vim" 
    editor_cmd = terminal .. " -e " .. editor

    -- Default modkey.
    -- Usually, Mod4 is the key with a logo between Control and Alt.
    -- If you do not like this or do not have such a key,
    -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
    -- However, you can use another modifier like Mod1, but it may interact with others.
    modkey = "Mod4"

    -- Table of layouts to cover with awful.layout.inc, order matters.
    awful.layout.layouts = { awful.layout.suit.tile }
}

return user_variables