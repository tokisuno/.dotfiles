-- these are to shut up my lsp
local awesome = awesome
local client  = client
local root    = root
local screen  = screen

local mouse = mouse

pcall(require, "luarocks.loader")

package.loaded["naughty.dbus"] = {}

local gears = require("gears")
local awful = require("awful")
              require("awful.autofocus")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local beautiful = require("beautiful")
local dpi = xresources.apply_dpi
local naughty = require("naughty")
      naughty.config.defaults['icon_size'] = 60
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
                      require("awful.hotkeys_popup.keys")

-- Load Widgets
local battery       = require("awesome-wm-widgets.battery-widget.battery")

if awesome.startup_errors then
  naughty.notify({ preset = naughty.config.presets.critical,
  title = "Oops, there were errors during startup!",
  text = awesome.startup_errors })
end
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    if in_error then return end
    in_error = true
    naughty.notify({ preset = naughty.config.presets.critical,
    title = "Oops, an error happened!",
    text = tostring(err) })
    in_error = false
  end)
end


beautiful.init("~/.config/awesome/themes/default/theme.lua")

terminal = "kitty"
browser = "brave"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

awful.layout.layouts = {
    awful.layout.suit.tile.left,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
}

menubar.utils.terminal = terminal -- Set the terminal for applications that require it

-- Create a wibox for each screen and add it
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
                     awful.button({}, 1, function (c)
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
                            awful.client.focus.byidx(1)
                        end),
                     awful.button({}, 5,
                        function()
                            awful.client.focus.byidx(-1)
                        end))

local function set_wallpaper()
    gears.wallpaper.set("#000000")
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)


awful.screen.connect_for_each_screen(function(s)
  set_wallpaper()
  local names = {"1", "2", "3", "4", "5", "6", "7", "8", "9"}
  local l = awful.layout.suit  -- Just to save some typing: use an alias.
  local layouts = {
    l.tile.left, l.tile.left, l.tile.left,
    l.tile.left, l.tile.left, l.tile.left,
    l.tile.left, l.tile.left, l.tile.left
  }
  awful.tag(names, s, layouts)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
  awful.button({}, 1, function() awful.layout.inc( 1) end),
  awful.button({}, 3, function() awful.layout.inc(-1) end),
  awful.button({}, 4, function() awful.layout.inc( 1) end),
  awful.button({}, 5, function() awful.layout.inc(-1) end)))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    layout = {
      spacing = 5,
      max_widget_size = awful.screen.focused().workarea.width * 0.30,
      layout  = wibox.layout.flex.horizontal
    },
  }

  -- Create the wibox
  s.mywibox = awful.wibar({
    position = "top",
    screen = s,
    opacity = 1,
    height = 24,
  })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      s.mytaglist,
    },
    wibox.layout.margin(s.mytasklist, 1, 1, 1, 1);
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      wibox.layout.margin(wibox.widget.systray(), 2, 2, 2, 2),
      wibox.widget.textbox(" "),
      battery(),
      wibox.widget.textclock(' %a '),
      s.mylayoutbox,
    },
  }
end)

-- mouse binds
root.buttons(gears.table.join(
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))

-- remaps (should put into a keys.lua or something)
globalkeys = gears.table.join(
    awful.key({ modkey, "Shift" }, "m", hotkeys_popup.show_help, {
        description = "show help",
        group = "awesome"
    }),
    awful.key({ modkey }, "Escape", awful.tag.history.restore, {
        description = "go back",
        group = "tag"
    }),

    -- default movement
    awful.key({ modkey }, "j", function() awful.client.focus.byidx(1) end, {
            description = "focus next by index",
            group = "client"
    }),
    awful.key({ modkey }, "k", function() awful.client.focus.byidx(-1) end, {
            description = "focus previous by index",
            group = "client"
    }),

    -- programs
    awful.key({ modkey }, "w", function() awful.spawn(browser) end, {
            description = "open brave (browser)",
            group = "awesome"
    }),
    awful.key({ modkey }, "Return", function() awful.spawn(terminal) end, {
            description = "open kitty",
            group = "launcher"
    }),
    awful.key({ modkey }, "z", function() awful.spawn("thunar") end, {
            description = "launch thunar",
            group = "launcher"
    }),
    awful.key({ modkey }, "v", function() awful.spawn("pavucontrol") end, {
            description = "launch pavucontrol",
            group = "launcher"
    }),
    awful.key({}, "Print", function() awful.spawn("flameshot gui") end, {
            description = "take screenshot",
            group = "launcher"
    }),
    awful.key({ modkey, "Shift" }, "s", function() awful.spawn(os.getenv("HOME") .. "/.local/share/scripts/lock") end, {
            description = "lockscreen",
            group = "launcher"
    }),

    -- layout movement/manipulation
    awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end, {
            description = "swap with next client by index",
            group = "client"
    }),
    awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end, {
            description = "swap with previous client by index",
            group = "client"
    }),

    -- testing 
    awful.key({ modkey, "Shift"}, "b", function ()
      require('lucas.find-cursor').find_cursor()
    end, {
        description = "Test",
        group = "test"
    }),

    -- moving to next monitor
    awful.key({ modkey }, "space", function()
        awful.screen.focus_relative(1)
        awful.spawn("find-cursor -o 2 -c blue -O red -g --distance 50 -w 400")
      end, {
        description = "focus the next screen",
        group = "screen"
    }),
    awful.key({modkey, "Shift"}, "space", function()
        awful.screen.focus_relative(1)
        awful.spawn("find-cursor -o 2 -c blue -O red -g --distance 50 -w 400")
      end, {
        description = "focus on the previous screen",
        group = "screen"
    }),
    -- client-based remaps
    awful.key({modkey}, "u", awful.client.urgent.jumpto, {
            description = "jump to urgent client",
            group = "client"
    }),

    awful.key({modkey, "Control"}, "r", awesome.restart, {
            description = "reload config",
            group = "awesome"
    }),
    awful.key({modkey, "Shift"}, "q", awesome.quit, {
            description = "exit awesome wm",
            group = "awesome"

          }),
    -- resize layouts
    awful.key({modkey}, "l", function() awful.tag.incmwfact( 0.05) end, {
            description = "increase master width factor",
            group = "layout"
    }),
    awful.key({modkey}, "h", function() awful.tag.incmwfact(-0.05) end, {
            description = "decrease master width factor",
            group = "layout"
    }),
    awful.key({modkey, "Shift"}, "h", function() awful.tag.incnmaster( 1, nil, true) end, {
            description = "increase the number of master clients",
            group = "layout"
    }),
    awful.key({modkey, "Shift"}, "l", function() awful.tag.incnmaster(-1, nil, true) end, {
            description = "decrease the number of master clients",
            group = "layout"
    }),
    awful.key({modkey, "Control"}, "h", function() awful.tag.incncol(1, nil, true) end, {
            description = "increase the number of columns",
            group = "layout"
    }),
    awful.key({modkey, "Control"}, "l", function() awful.tag.incncol(-1, nil, true) end, {
            description = "decrease the number of columns",
            group = "layout"
    }),

    -- change layouts
    awful.key({modkey}, "Tab", function() awful.layout.inc(1) end, {
            description = "select next",
            group = "layout"
    }),
    awful.key({modkey, "Shift"}, "Tab", function() awful.layout.inc(-1) end, {
            description = "select previous",
            group = "layout"
    }),

    -- rofi modes
    awful.key({modkey}, "p", function() awful.spawn('rofi -modes "drun" -show drun') end, {
            description = "launch rofi-drun",
            group = "launcher"
    }),
    awful.key({modkey}, "c", function() awful.spawn('rofi -show calc -modi calc -no-show-match -no-sort') end, {
            description = "launch rofi-drun",
            group = "launcher"
    }),

    -- Media keys
    awful.key({ modkey }, "]", function() awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") end, {
            description = "vol +5%",
            group = "volume"
    }),
    awful.key({ modkey }, "[", function() awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%") end, {
            description = "vol -5%",
            group = "volume"
    }),
    awful.key({ modkey }, "\\", function() awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end, {
            description = "vol MUTE",
            group = "volume"
    }),

    -- Laptop media keys
    awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") end, {
            description = "vol +5%",
            group = "laptop"
    }),
    awful.key({}, "XF86AudioLowerVolume", function() awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%") end, {
            description = "vol -5%",
            group = "laptop"
    }),
    awful.key({}, "XF86AudioMute", function() awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end, {
            description = "vol MUTE",
            group = "laptop"
    }),
    awful.key({}, "XF86MonBrightnessUp", function() awful.spawn("xbacklight -inc 10") end, {
            description = "Laptop brightness up",
            group = "laptop"
    }),
    awful.key({}, "XF86MonBrightnessDown", function() awful.spawn("xbacklight -dec 10") end, {
            description = "Laptop brightness down",
            group = "laptop"
    })
)

clientkeys = gears.table.join(
    awful.key({modkey}, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, {
            description = "toggle fullscreen",
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
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

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

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  },

-- Floating clients.
  {
    rule_any = {
      instance = {
        "DTA",  -- Firefox addon DownThemAll.
        "copyq",  -- Includes session name in class.
        "pinentry",
      },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "MessageWin",  -- kalarm.
        "Sxiv",
        "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        "Wpa_gui",
        "veromix",
        "xtightvncviewer"
      },
      name = {
        "Event Tester",  -- xev.
      },
      role = {
        "AlarmWindow",  -- Thunderbird's calendar.
        "ConfigManager",  -- Thunderbird's about:config.
        "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { floating = true }
  },
  {
    rule = { class = "Firefox" },
    properties = {
      screen = 1,
      tag = "2"
    }
  },
}
-- }}}

client.connect_signal("manage",
    function (c)
        if awesome.startup
            and not c.size_hints.user_position
            and not c.size_hints.program_position then
            awful.placement.no_offscreen(c)
        end
    end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter",
    function(c)
        c:emit_signal("request::activate", "mouse_enter", {raise = false})
    end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

awful.spawn("/home/poto/Dropbox/.dotfiles/.config/awesome/autostart.sh")
awful.spawn("/home/skinnyboot/Dropbox/.dotfiles/.config/awesome/autostart.sh")
