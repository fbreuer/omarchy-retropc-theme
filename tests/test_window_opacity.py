"""Exercise RetroPC's Hyprland override with Lua config/rule collectors."""

from pathlib import Path
import shutil
import subprocess
import unittest

ROOT = Path(__file__).resolve().parents[1]


class WindowOpacityTests(unittest.TestCase):
    @unittest.skipUnless(shutil.which("lua"), "Standalone Lua is needed for the rule collector")
    def test_opaque_applications_without_shell_changes(self):
        script = r'''
local configs, rules = {}, {}
hl = {
  config = function(config) configs[#configs + 1] = config end,
}
o = {
  window = function(match, rule)
    rule.match = match
    rules[#rules + 1] = rule
  end,
}
dofile(arg[1])
assert(#configs == 1 and #rules == 1)
local config, rule = configs[1], rules[1]
assert(config.decoration.active_opacity == 1)
assert(config.decoration.inactive_opacity == 1)
assert(config.decoration.fullscreen_opacity == 1)
assert(config.general.col.active_border == "#CC9900")
assert(config.general.col.inactive_border == "rgba(595959aa)")
assert(config.group.col.border_active == config.general.col.active_border)
assert(config.group.col.border_inactive == config.general.col.inactive_border)
assert(rule.name == "retropc-opaque-windows")
assert(rule.match.class == "negative:^org\\.quickshell$")
assert(rule.opacity == "1 override 1 override 1 override")
assert(rule.opaque == true and rule.force_rgbx == true)
-- No layer rule, shell config, animations, cursor or hardware override.
for key in pairs(config) do
  assert(key == "decoration" or key == "general" or key == "group", key)
end
'''
        subprocess.run(
            [shutil.which("lua"), "-", str(ROOT / "hyprland.lua")],
            input=script, text=True, check=True, capture_output=True,
        )


if __name__ == "__main__":
    unittest.main()
