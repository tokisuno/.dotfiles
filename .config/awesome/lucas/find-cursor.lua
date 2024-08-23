local M = {}
local awful = require('awful')
local gears = require('gears')
local mouse = mouse

function M.find_cursor()
  awful.spawn("notify-send '"..mouse.coords().x.." "..mouse.coords().y.."'")
end

return M
