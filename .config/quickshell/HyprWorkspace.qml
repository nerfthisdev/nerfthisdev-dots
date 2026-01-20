import Quickshell.Hyprland
import QtQuick

Repeater {
    model: 9

    Text {
        property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
        property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
        text: index + 1
        color: isActive ? Theme.accent : (ws ? Theme.accentAlt : Theme.wsInactive)
        font {
            pixelSize: Theme.fontNormal
            bold: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: Hyprland.dispatch("workspace " + (index + 1))
        }
    }
}
