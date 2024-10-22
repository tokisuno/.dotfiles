local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local function worker()
  local font = beautiful.font

  minutes_widget = wibox.widget {
    {
      id = "minutes_left",
      font = font,
      widget = wibox.widget.textbox,
    },
    layout = wibox.layout.align.horizontal,
    set_text = function(self, time)
      self:get_children_by_id('minutes_left')[1]:set_markup(time)
    end
  }

  gears.timer {
    timeout = 60,
    call_now = true,
    autostart = true,
    callback = function()
      local time = os.date("*t")
      local minutes_left = 1440 - ((time.hour * 60) + time.min)
      minutes_widget:set_text(minutes_left)
    end
  }

  return minutes_widget
end

return setmetatable(minutes_widget, { __call = function(_, ...) return worker(...) end })
