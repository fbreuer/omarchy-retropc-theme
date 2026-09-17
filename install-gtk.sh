#!/bin/bash

set -euo pipefail

theme_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
gtk_theme_link="$HOME/.local/share/themes/RetroPC"

mkdir -p "$HOME/.local/share/themes"

if [[ -e $gtk_theme_link && ! -L $gtk_theme_link ]]; then
  echo "Refusing to replace existing non-symlink: $gtk_theme_link" >&2
  exit 1
fi

ln -sfn "$theme_root" "$gtk_theme_link"
omarchy hook install theme-set "$theme_root/hooks/retropc-gtk"
"$theme_root/hooks/retropc-gtk" retropc

echo "RetroPC GTK 3/4 and Yaru-yellow-dark icons are installed and active."
