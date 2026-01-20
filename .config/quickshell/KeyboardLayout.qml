pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland

Singleton {
    id: root

    property string layout: ""
    property string device: ""
    readonly property string displayLayout: formatLayout(layout)

    signal layoutUpdated(string layout, string device)

    function formatLayout(layoutName) {
        if (!layoutName)
            return "";
        var trimmed = String(layoutName).trim();
        if (!trimmed)
            return "";

        if (trimmed.indexOf("Russian") >= 0 || trimmed.toLowerCase().indexOf("ru") === 0)
            return "ru";
        if (trimmed.indexOf("English") >= 0 || trimmed.toLowerCase().indexOf("us") === 0)
            return "us";

        var leftParen = trimmed.indexOf("(");
        var rightParen = trimmed.indexOf(")", leftParen + 1);
        if (leftParen >= 0 && rightParen > leftParen + 1) {
            var inside = trimmed.slice(leftParen + 1, rightParen).trim();
            if (inside && inside.length <= 4)
                return inside.toUpperCase();
        }

        if (trimmed.length <= 4)
            return trimmed.toUpperCase();

        return trimmed;
    }

    function updateFromEvent(event) {
        if (!event)
            return;
        if (event.name !== "activelayout" && event.name !== "keyboardlayout")
            return;

        var deviceName = "";
        var layoutName = "";
        var parts = event.parse(2);
        if (parts && parts.length >= 2) {
            deviceName = String(parts[0]).trim();
            layoutName = String(parts[1]).trim();
        } else {
            var raw = String(event.data || "");
            var comma = raw.indexOf(",");
            if (comma >= 0) {
                deviceName = raw.slice(0, comma).trim();
                layoutName = raw.slice(comma + 1).trim();
            } else {
                layoutName = raw.trim();
            }
        }

        if (!layoutName)
            return;
        if (layoutName === layout && deviceName === device)
            return;

        layout = layoutName;
        device = deviceName;
        layoutUpdated(layout, device);
    }

    Connections {
        target: Hyprland
        function onRawEvent(event) {
            root.updateFromEvent(event)
        }
    }
}
