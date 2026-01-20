pragma Singleton

import QtQuick
import Quickshell.Io

Item {
    id: theme
    visible: false
    width: 0
    height: 0

    /* ---------- FONT / LAYOUT (static) ---------- */

    readonly property int fontSmall: 11
    readonly property int fontNormal: 14
    readonly property int fontLarge: 16

    readonly property int panelHeight: 30
    readonly property int panelPadding: 8
    readonly property int itemSpacing: 8

    readonly property int radius: 6

    /* ---------- PALETTE FILE ---------- */

    FileView {
        id: palette

        path: "/home/nerfthisdev/.cache/hellwal/colors.json"

        watchChanges: true
        onFileChanged: reload()

        JsonAdapter {
            id: j

            property string wallpaper: ""
            property int alpha: 100

            property JsonObject special: JsonObject {
                property string background: "#1a1b26"
                property string foreground: "#f5f5f5"
                property string cursor: "#f5f5f5"
                property string border: "#2a2f3a"
            }

            property JsonObject colors: JsonObject {
                property string color0:  "#15161e"
                property string color1:  "#f7768e"
                property string color2:  "#9ece6a"
                property string color3:  "#e0af68"
                property string color4:  "#7aa2f7"
                property string color5:  "#bb9af7"
                property string color6:  "#7dcfff"
                property string color7:  "#a9b1d6"
                property string color8:  "#414868"
                property string color9:  "#f7768e"
                property string color10: "#9ece6a"
                property string color11: "#e0af68"
                property string color12: "#7aa2f7"
                property string color13: "#bb9af7"
                property string color14: "#7dcfff"
                property string color15: "#c0caf5"
            }
        }
    }

    /* ---------- EXPOSE AS COLORS ---------- */

    // special
    readonly property color background: j.special.background
    readonly property color foreground: j.special.foreground
    readonly property color cursor:     j.special.cursor
    readonly property color border:     j.special.border

    // ansi
    readonly property color color0:  j.colors.color0
    readonly property color color1:  j.colors.color1
    readonly property color color2:  j.colors.color2
    readonly property color color3:  j.colors.color3
    readonly property color color4:  j.colors.color4
    readonly property color color5:  j.colors.color5
    readonly property color color6:  j.colors.color6
    readonly property color color7:  j.colors.color7
    readonly property color color8:  j.colors.color8
    readonly property color color9:  j.colors.color9
    readonly property color color10: j.colors.color10
    readonly property color color11: j.colors.color11
    readonly property color color12: j.colors.color12
    readonly property color color13: j.colors.color13
    readonly property color color14: j.colors.color14
    readonly property color color15: j.colors.color15

    readonly property int alpha: j.alpha
    readonly property string wallpaper: j.wallpaper

    /* ---------- YOUR UI MAPPING ---------- */

    readonly property color barBg: background
    readonly property color textPrimary: foreground
    readonly property color textMuted: color8

    readonly property color accent: color4
    readonly property color accentAlt: color6

    readonly property color wsInactive: color0

    readonly property color osdBg: Qt.rgba(background.r, background.g, background.b, 0.85)
    readonly property color osdBorder: accent
    readonly property color osdText: textPrimary
}
