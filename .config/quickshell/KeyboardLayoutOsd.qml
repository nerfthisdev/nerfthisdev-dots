import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Scope {
    id: root

    property bool showOsd: false
    property string layoutText: ""

    Timer {
        id: hideTimer
        interval: 1200
        repeat: false
        onTriggered: root.showOsd = false
    }

    Connections {
        target: KeyboardLayout
        function onLayoutUpdated(layout, device) {
            var text = KeyboardLayout.displayLayout || KeyboardLayout.layout;
            if (!text)
                return;
            root.layoutText = text;
            root.showOsd = true;
            hideTimer.restart();
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: osd
            required property var modelData
            screen: modelData

            anchors {
                left: true
                right: true
                bottom: true
            }

            exclusionMode: ExclusionMode.Ignore
            aboveWindows: true
            focusable: false
            color: "transparent"
            implicitHeight: 80

            property var hyprMonitor: Hyprland.monitorFor(modelData)
            visible: root.showOsd && (!hyprMonitor || hyprMonitor.focused)

            Item {
                anchors.fill: parent

                Rectangle {
                    id: bubble
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 12
                    implicitWidth: 56
                    implicitHeight: 56
                    radius: Theme.radius
                    color: Theme.osdBg

                    Text {
                        anchors.centerIn: parent
                        text: root.layoutText
                        color: Theme.osdText
                        font.pixelSize: Theme.fontLarge
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
}
