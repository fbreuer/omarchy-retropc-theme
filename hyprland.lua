-- RetroPC's Omarchy 4 theme loads after the default application window rules.
local active_border_color = "#CC9900"
local inactive_border_color = "rgba(595959aa)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },
  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },
  decoration = {
    active_opacity = 1,
    inactive_opacity = 1,
    fullscreen_opacity = 1,
  },
})

-- Layer-shell surfaces are not window-rule targets. Exclude Quickshell's
-- ordinary windows too, so shell elements retain their own alpha/transitions.
o.window({ class = "negative:^org\\.quickshell$" }, {
  name = "retropc-opaque-windows",
  opacity = "1 override 1 override 1 override",
  opaque = true,
  force_rgbx = true,
})
