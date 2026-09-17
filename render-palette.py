#!/usr/bin/env python3
"""Render the canonical RetroPC palette as a PNG using Cairo."""

from pathlib import Path
import argparse
import cairo


PALETTE = (
    ("PHOSPHOR BLACK", "#0A0A08"),
    ("WARM BLACK", "#1A1612"),
    ("DARK AMBER", "#2A1F00"),
    ("BURNT OCHRE", "#805500"),
    ("DIM AMBER", "#996600"),
    ("COPPER", "#CC7700"),
    ("DEEP GOLD", "#CC8800"),
    ("OCHRE", "#CC9900"),
    ("GOLD", "#D4AA00"),
    ("DEEP ORANGE", "#FF6600"),
    ("ORANGE", "#FF8800"),
    ("HOT AMBER", "#FF9900"),
    ("LIGHT AMBER", "#FFAA00"),
    ("TERMINAL AMBER", "#FFB000"),
    ("BRIGHT ORANGE", "#FFBB00"),
    ("BRIGHT AMBER", "#FFCC00"),
    ("GOLDEN YELLOW", "#FFD700"),
    ("PHOSPHOR YELLOW", "#FFDD00"),
)


def rgb(hex_color):
    value = hex_color.lstrip("#")
    return tuple(int(value[i : i + 2], 16) / 255 for i in (0, 2, 4))


def text_color(hex_color):
    red, green, blue = rgb(hex_color)
    luminance = 0.2126 * red + 0.7152 * green + 0.0722 * blue
    return rgb("#0A0A08" if luminance > 0.48 else "#FFCC00")


def set_font(context, size, weight=cairo.FONT_WEIGHT_NORMAL):
    context.select_font_face(
        "Berkeley Mono Nerd Font", cairo.FONT_SLANT_NORMAL, weight
    )
    context.set_font_size(size)


def draw_text(context, text, x, y, color, size, weight=cairo.FONT_WEIGHT_NORMAL):
    context.set_source_rgb(*color)
    set_font(context, size, weight)
    context.move_to(x, y)
    context.show_text(text)


def render(output, width=1920, height=1200):
    surface = cairo.ImageSurface(cairo.FORMAT_ARGB32, width, height)
    context = cairo.Context(surface)

    context.set_source_rgb(*rgb("#0A0A08"))
    context.paint()

    margin = 92
    draw_text(
        context,
        "RETROPC // COLOR PALETTE",
        margin,
        102,
        rgb("#FFCC00"),
        46,
        cairo.FONT_WEIGHT_BOLD,
    )
    draw_text(
        context,
        "18 CANONICAL COLORS  /  RGB HEX",
        margin,
        148,
        rgb("#996600"),
        21,
    )

    columns = 3
    rows = 6
    gap_x = 28
    gap_y = 24
    top = 204
    bottom = 78
    card_width = (width - 2 * margin - (columns - 1) * gap_x) / columns
    card_height = (height - top - bottom - (rows - 1) * gap_y) / rows

    for index, (name, hex_color) in enumerate(PALETTE):
        column = index % columns
        row = index // columns
        x = margin + column * (card_width + gap_x)
        y = top + row * (card_height + gap_y)

        context.set_source_rgb(*rgb(hex_color))
        context.rectangle(x, y, card_width, card_height)
        context.fill()

        context.set_source_rgba(*rgb("#805500"), 0.75)
        context.set_line_width(2)
        context.rectangle(x + 1, y + 1, card_width - 2, card_height - 2)
        context.stroke()

        ink = text_color(hex_color)
        draw_text(
            context,
            f"{index + 1:02d}  {name}",
            x + 25,
            y + 43,
            ink,
            18,
            cairo.FONT_WEIGHT_BOLD,
        )
        draw_text(
            context,
            hex_color,
            x + 25,
            y + card_height - 25,
            ink,
            27,
            cairo.FONT_WEIGHT_BOLD,
        )

    context.set_source_rgb(*rgb("#805500"))
    context.set_line_width(2)
    context.move_to(margin, height - 42)
    context.line_to(width - margin, height - 42)
    context.stroke()
    draw_text(
        context,
        "AMBER PHOSPHOR DISPLAY SYSTEM  //  CAIRO RENDER",
        margin,
        height - 17,
        rgb("#996600"),
        15,
    )

    output.parent.mkdir(parents=True, exist_ok=True)
    surface.write_to_png(str(output))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--output",
        type=Path,
        default=Path(__file__).with_name("retropc-palette.png"),
    )
    parser.add_argument("--width", type=int, default=1920)
    parser.add_argument("--height", type=int, default=1200)
    args = parser.parse_args()
    render(args.output, args.width, args.height)


if __name__ == "__main__":
    main()
