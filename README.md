# Omarchy RetroPC Theme

This is the RetroPC Theme for [Omarchy.org](https://omarchy.org), providing a retro, cohesive and visually appealing configuration set for your Linux desktop environment.

<p align="center">
  <img src="theme.png" alt="RetroPC Theme Preview">
</p>

```
Remote terminals hum, a whisper in the wires,
Echoes of code beneath phosphor-lit spires.
Typing in shadows, the amber screen glows—
Revealing secrets only silence knows.
Old-school intrusion, soft light, sharp mind—where legends in dim rooms rewrote mankind.
```

## Installation

To install this theme, simply use the `omarchy-theme-install` command:

```bash
omarchy-theme-install https://github.com/rondilley/omarchy-retropc-theme
```

## Included Configurations

This theme includes configurations for:

- Alacritty (alacritty.toml)
- btop (btop.theme)
- Hyprland (hyprland.conf, hyprlock.conf)
- Mako (mako.ini)
- Neovim (neovim.lua)
- Doom Emacs (retropc-theme.el)
- GTK 3 and GTK 4 (gtk-3.0/, gtk-4.0/, index.theme)
- GTK icon theme selection (icons.theme; Yaru-yellow-dark)
- Helix (helix.toml)
- Visual Studio Code (vscode-theme.json)
- Zed (zed.json)
- Waybar (waybar.css)
- Wofi (wofi.css)
- Walker (walker.css)
- SwayOSD (swayosd.css)
- Desktop Background (backgrounds/amber_tube.jpg)
- Font (fonts/Bm437_IBM_XGA-AI_12x23.otb)

## Editor Themes

Omarchy automatically uses `helix.toml` and `vscode-theme.json` when applying
the theme. Restart VS Code after the first application so it can discover the
generated local extension.

Install the Doom Emacs theme and enable it in `~/.config/doom/config.el`:

```bash
mkdir -p ~/.config/doom/themes
cp retropc-theme.el ~/.config/doom/themes/
```

```emacs-lisp
(setq doom-theme 'retropc)
```

Zed is not currently synchronized by Omarchy. Install its theme manually:

```bash
mkdir -p ~/.config/zed/themes
cp zed.json ~/.config/zed/themes/retropc.json
```

Then select `RetroPC` in Zed's theme picker or set it in
`~/.config/zed/settings.json`:

```json
{
  "theme": {
    "mode": "dark",
    "dark": "RetroPC"
  }
}
```

## Palette Reference

![RetroPC color palette](retropc-palette.png)

The chart contains the 18 canonical colors defined by the original Alacritty
and Neovim configurations. Regenerate it with Cairo and Berkeley Mono:

```bash
python3 render-palette.py
```

## GTK Theme

Install and apply the GTK 3, GTK 4/libadwaita, and icon-theme integration:

```bash
./install-gtk.sh
```

The installer links this repository into `~/.local/share/themes/RetroPC`, adds
the GTK 4 user override needed by libadwaita applications such as Nautilus,
selects `Yaru-yellow-dark` icons, and installs `hooks/retropc-gtk` as an Omarchy
`theme-set` hook. The hook reapplies GTK when RetroPC is selected and removes
only its managed GTK 4 override when switching away. An existing user override
is backed up and restored automatically.

Restart open GTK applications after applying the theme.

## Recommended additions
Cool Retro Term
```bash
sudo pacman -S cool-retro-term
```
Retro Font
```bash
mkdir ~/.local/share/fonts/retro
cp fonts/Bm437_IBM_XGA-AI_12x23.otb ~/.local/share/fonts/retro
fc-cache
```

## Using Retro Fonts

**Don't forget to comment out the font definitions in ~/.config/alacritty.toml**

```
#[font]
#normal = { family = "CaskaydiaMono Nerd Font", style = "Regular" }
#bold = { family = "CaskaydiaMono Nerd Font", style = "Bold" }
#italic = { family = "CaskaydiaMono Nerd Font", style = "Italic" }
#size = 9
```

## Inspiration
[https://github.com/bjarneo/omarchy-ash-theme](https://github.com/bjarneo/omarchy-ash-theme)

## X.com
[Ron_Dilley](https://x.com/Ron_Dilley)
