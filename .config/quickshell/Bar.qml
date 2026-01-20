// Bar.qml
import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
    // no more time object

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            color: Theme.barBg
            property int fontSize: 14

            implicitHeight: Theme.panelHeight

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 8

                HyprWorkspace {

                }

                Item {
                    Layout.fillWidth: true
                } // спейсер, толкает всё вправо

                BatteryWidget {
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                }

                ClockWidget {
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                }


            }
        }
    }
}
