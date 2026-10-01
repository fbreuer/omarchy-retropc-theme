"""Pure-black base surfaces, with amber/raised surfaces and alpha retained."""

import ast
import json
from pathlib import Path
import re
import tomllib
import unittest

ROOT = Path(__file__).resolve().parents[1]
BLACK = "#000000"


def text(name):
    return (ROOT / name).read_text()


def toml(name):
    return tomllib.loads(text(name))


class BackgroundTests(unittest.TestCase):
    def test_semantic_palette(self):
        palette = toml("colors.toml")
        for key in ("background", "dark_background", "darker_background"):
            self.assertEqual(palette[key], BLACK)
        self.assertEqual(palette["lighter_background"], "#1A1612")
        self.assertEqual(palette["foreground"], "#FFB000")
        self.assertEqual(palette["selection"], "#2A1F00")
        self.assertEqual(palette["hyprland_active_border"], "#CC9900")

    def test_structured_files_parse(self):
        for path in ROOT.glob("*.toml"):
            with self.subTest(path=path.name):
                tomllib.loads(path.read_text())
        for path in ROOT.glob("*.json"):
            with self.subTest(path=path.name):
                json.loads(path.read_text())

    def test_terminals_and_editors(self):
        alacritty = toml("alacritty.toml")["colors"]
        self.assertEqual(alacritty["primary"]["background"], BLACK)
        self.assertEqual(alacritty["cursor"]["text"], BLACK)
        self.assertEqual(alacritty["vi_mode_cursor"]["text"], BLACK)
        self.assertEqual(alacritty["normal"]["black"], "#2A1F00")
        self.assertEqual(alacritty["bright"]["black"], "#805500")
        self.assertIn("background = #000000\n", text("ghostty.conf"))
        self.assertIn('theme[main_bg]=""', text("btop.theme"))
        self.assertEqual(toml("helix.toml")["palette"]["background"], BLACK)
        self.assertIn('bg0 = "#000000", bg1 = "#000000"', text("neovim.lua"))
        self.assertIn('lualine_inactive_bg = "#181813"', text("neovim.lua"))
        for slot in ("bg0", "bg1"):
            self.assertRegex(text("retropc-theme.el"), rf'\({slot}\s+"#000000"\)')
        self.assertIn("Background = #000000", text("mc.ini"))

    def test_json_surfaces_and_transparency(self):
        vscode = json.loads(text("vscode-theme.json"))["colors"]
        for key in ("editor.background", "editorGutter.background", "panel.background",
                    "terminal.background", "sideBar.background", "activityBar.background"):
            self.assertEqual(vscode[key], BLACK)
        self.assertEqual(vscode["editorWidget.background"], "#1A1612")
        self.assertEqual(vscode["editor.lineHighlightBorder"], "#00000000")
        zed = json.loads(text("zed.json"))["themes"][0]["style"]
        for key in ("background", "panel.background", "editor.background",
                    "editor.gutter.background", "terminal.background", "terminal.ansi.background"):
            self.assertEqual(zed[key], BLACK)
        self.assertEqual(zed["scrollbar.track.background"], "#00000000")
        self.assertEqual(zed["surface.background"], "#0F0E0A")
        self.assertEqual(zed["elevated_surface.background"], "#1A1612")

    def test_shell_and_legacy_consumers(self):
        for section in ("menu", "launcher"):
            colors = toml(f"shell.{section}.toml")[section]
            for key in ("background", "scrim", "selected-text"):
                self.assertEqual(colors[key], BLACK)
            self.assertEqual(colors["scrim-alpha"], 0.5)
            self.assertEqual(colors["selected-background"], "#FFCC00")
        for section in ("bar", "notifications"):
            self.assertEqual(toml(f"shell.{section}.toml")[section]["background"], "#1A1612")
        self.assertEqual(text("chromium.theme").strip(), "0,0,0")
        self.assertIn("$color = rgba(0,0,0,1.0)", text("hyprlock.conf"))
        self.assertIn("@define-color background #000000;", text("gtk-3.0/gtk.css"))
        for name in ("window_bg_color", "view_bg_color", "dialog_bg_color", "accent_fg_color"):
            self.assertIn(f"@define-color {name} #000000;", text("gtk-4.0/gtk.css"))
        for filename, slot in (("walker.css", "base"), ("wofi.css", "bg"),
                               ("swayosd.css", "background-color")):
            self.assertIn(f"@define-color {slot} #000000;", text(filename))

    def test_no_warm_base_survives_in_theme_inputs(self):
        obsolete = re.compile(r"#(?:0a0a08|080806|050504)(?:[0-9a-f]{2})?(?![0-9a-f])", re.I)
        suffixes = {".toml", ".json", ".conf", ".ini", ".theme", ".css", ".lua", ".el", ".py"}
        for path in ROOT.rglob("*"):
            relative = path.relative_to(ROOT)
            if any(part.startswith(".") or part == "tests" for part in relative.parts):
                continue
            if path.is_file() and path.suffix in suffixes:
                with self.subTest(path=str(relative)):
                    self.assertIsNone(obsolete.search(path.read_text()))

    def test_palette_chart_source(self):
        tree = ast.parse(text("render-palette.py"))
        palette = next(ast.literal_eval(node.value) for node in tree.body
                       if isinstance(node, ast.Assign)
                       and any(isinstance(target, ast.Name) and target.id == "PALETTE"
                               for target in node.targets))
        self.assertEqual(len(palette), 18)
        self.assertEqual(palette[0], ("PHOSPHOR BLACK", BLACK))
        self.assertEqual(palette[1], ("WARM BLACK", "#1A1612"))
        self.assertIn('context.set_source_rgb(*rgb("#000000"))', text("render-palette.py"))


if __name__ == "__main__":
    unittest.main()
