local gears = require("gears")
local awful = require("awful")

local modkey = "Mod4"
local terminal = "ghostty"
local browser = "firefox"
-- local editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

globalkeys = gears.table.join(
    awful.key({ modkey }, "Escape", awful.tag.history.restore),

    -- default movement
    awful.key({ modkey }, "j", function() awful.client.focus.byidx( 1) end),
    awful.key({ modkey }, "k", function() awful.client.focus.byidx(-1) end),

    -- programs
    awful.key({ modkey }, "w", function() awful.spawn(browser) end),
    awful.key({ modkey }, "Return", function() awful.spawn(terminal .. " -e tmux attach") end),
    awful.key({ modkey, "Shift" }, "Return", function() awful.spawn(terminal) end),
    awful.key({ modkey }, "z", function() awful.spawn("thunar") end),
    awful.key({ modkey }, "v", function() awful.spawn("pavucontrol") end),
    awful.key({}, "Print", function() awful.spawn("flameshot gui") end),
    awful.key({ modkey, "Shift" }, "s", function() awful.spawn(os.getenv("HOME") .. "/.local/share/scripts/lock") end),

    -- layout movement/manipulation
    awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx( 1) end),
    awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end),

    -- moving to next monitor
    awful.key({ modkey }, "space", function()
        awful.screen.focus_relative(1)
        -- awful.spawn("find-cursor -o 2 -c blue -O red -g --distance 50 -w 400")
      end
      ),

    -- client-based remaps
    awful.key({modkey}, "u", awful.client.urgent.jumpto),

    awful.key({modkey, "Control"}, "r", awesome.restart),
    awful.key({modkey, "Shift"}, "q", awesome.quit),
    awful.key({modkey}, "l", function() awful.tag.incmwfact( 0.05) end),
    awful.key({modkey}, "h", function() awful.tag.incmwfact(-0.05) end),
    awful.key({modkey, "Shift"}, "h", function() awful.tag.incnmaster( 1, nil, true) end),
    awful.key({modkey, "Shift"}, "l", function() awful.tag.incnmaster(-1, nil, true) end),
    awful.key({modkey, "Control"}, "h", function() awful.tag.incncol(1, nil, true) end),
    awful.key({modkey, "Control"}, "l", function() awful.tag.incncol(-1, nil, true) end),

    -- change layouts
    awful.key({modkey}, "Tab", function() awful.layout.inc(1) end, {
            description = "select next",
            group = "layout"
    }),

    -- rofi modes
    awful.key({modkey}, "p", function() awful.spawn('rofi -modes "drun" -show drun') end),

    -- Media keys
    awful.key({ modkey }, "]", function() awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") end),
    awful.key({ modkey }, "[", function() awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%") end),
    awful.key({ modkey }, "\\", function() awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end),

    -- Laptop media keys
    awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") end),
    awful.key({}, "XF86AudioLowerVolume", function() awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%") end),
    awful.key({}, "XF86AudioMute", function() awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end),
    awful.key({}, "XF86MonBrightnessUp", function() awful.spawn("xbacklight -inc 10") end),
    awful.key({}, "XF86MonBrightnessDown", function() awful.spawn("xbacklight -dec 10") end)
)

for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9, function()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then tag:view_only() end
        end
        ),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
        function()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then awful.tag.viewtoggle(tag) end
        end
        ),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
        function()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then client.focus:move_to_tag(tag) end
          end
        end
        ),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
        function()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then client.focus:toggle_tag(tag) end
          end
        end
        )
    )
end

clientkeys = gears.table.join(
    awful.key({modkey}, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, {
            description = "toggle fullscreen",
            group = "client"
        }),
    awful.key({modkey}, "m",
        function (c)
          c.maximized_horizontal = not c.maximized_horizontal
          c.maximized_vertical = not c.maximized_vertical
        end, {
        description = "toggle window maximize",
        group = "client"
      }),
    awful.key({modkey}, "q", function (c) c:kill() end, {
            description = "close",
            group = "client"
        }),
    awful.key({modkey, "Shift"}, "f",
        awful.client.floating.toggle, {
            description = "toggle floating",
            group = "client"
        }),
    awful.key({modkey, "Control"}, "Return", function (c) c:swap(awful.client.getmaster()) end, {
            description = "move to master",
            group = "client"
        }),
    awful.key({modkey}, "o", function (c) c:move_to_screen() end, {
            description = "move to screen",
            group = "client"
        }),
    awful.key({modkey}, "t", function (c) c.ontop = not c.ontop end, {
            description = "toggle keep on top",
            group = "client"
        })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.

clientbuttons = gears.table.join(
  awful.button({}, 1,
    function(c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),

  awful.button({modkey}, 1,
    function(c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
      awful.mouse.client.move(c)
    end),

  awful.button({modkey}, 3,
    function(c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
      awful.mouse.client.resize(c)
    end))


root.keys(globalkeys)
