local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local battery = require "config.awesome-wm-widgets.battery-widget.battery"
local xresources = require("beautiful.xresources")
local beautiful = require("beautiful")
local modkey = "Mod4"
local client = client
local dpi = xresources.apply_dpi

awful.layout.layouts = { awful.layout.suit.tile.left }

local taglist_buttons = gears.table.join(
                    awful.button({}, 1,
                        function(t) t:view_only()
                    end),
                    awful.button({modkey}, 1,
                        function(t)
                            if client.focus then
                                client.focus:move_to_tag(t)
                            end
                        end),
                    awful.button({}, 3,
                        awful.tag.viewtoggle),
                    awful.button({modkey}, 3,
                        function(t)
                            if client.focus then
                                client.focus:toggle_tag(t)
                            end
                        end),
                    awful.button({}, 4,
                        function(t)
                            awful.tag.viewnext(t.screen)
                        end),
                    awful.button({}, 5,
                        function(t)
                            awful.tag.viewprev(t.screen)
                        end))

local tasklist_buttons = gears.table.join(
                      awful.button({}, 1,
                        function (c)
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
                      awful.button({}, 3,
                        function()
                          awful.menu.client_list({ theme = { width = 250 } })
                        end),
                      awful.button({}, 4,
                        function()
                          awful.client.focus.byidx( 1)
                        end),
                      awful.button({}, 5,
                        function()
                          awful.client.focus.byidx(-1)
                        end))

awful.screen.connect_for_each_screen(function(s)
    awful.tag({ " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " }, s, awful.layout.layouts[1])
    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(
      gears.table.join(
          awful.button({ }, 1, function () awful.layout.inc( 1) end),
          awful.button({ }, 3, function () awful.layout.inc(-1) end),
          awful.button({ }, 4, function () awful.layout.inc( 1) end),
          awful.button({ }, 5, function () awful.layout.inc(-1) end)
        )
    )
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = "26" })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mylayoutbox,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
          layout = wibox.layout.fixed.horizontal,
          wibox.layout.margin(wibox.widget.systray(), 2, 2, 2, 2),
          battery(),
          wibox.widget.textclock(' %a '),
        },
    }
end)
