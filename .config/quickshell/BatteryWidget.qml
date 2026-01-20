import QtQuick

Item {
    id: root

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight
    property bool hasTime: Charge.isCharging ? Charge.timeToFull > 0 : Charge.timeToEmpty > 0
    property string tooltipText: Charge.isCharging
        ? ("Full in " + fmtSeconds(Charge.timeToFull))
        : ("Empty in " + fmtSeconds(Charge.timeToEmpty))

    // we no longer need time as an input

    function level(p) {
        p = Math.max(0, Math.min(100, p || 0));
        if (p <= 10)
            return 0;
        if (p <= 20)
            return 1;
        if (p <= 30)
            return 2;
        if (p <= 40)
            return 3;
        if (p <= 50)
            return 4;
        if (p <= 60)
            return 5;
        if (p <= 70)
            return 6;
        if (p <= 80)
            return 7;
        if (p <= 90)
            return 8;
        return 9;
    }

    function iconFor(p, charging) {
        var l = level(p);
        if (charging) {
            return ["󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"][l];
        }
        return ["󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"][l];
    }

    function fmtSeconds(sec) {
        sec = Math.max(0, Math.floor(sec || 0));
        var h = Math.floor(sec / 3600);
        var m = Math.floor((sec % 3600) / 60);
        if (h <= 0 && m <= 0)
            return "0m";
        if (h <= 0)
            return m + "m";
        return h + "h " + m + "m";
    }

    Row {
        id: row
        Text {
            id: icon
            text: iconFor(Charge.batteryCharge * 100, Charge.isCharging)
		    color: Theme.textPrimary
            font.pixelSize: Theme.fontNormal
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            text: Charge.batteryChargeStr
		    color: Theme.textPrimary
            font.pixelSize: Theme.fontNormal
            verticalAlignment: Text.AlignVCenter
	}
	
    }

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
    }

    Rectangle {
        id: tooltipBody
        visible: hoverArea.containsMouse && root.hasTime
        color: Theme.background
        radius: Theme.radius
        opacity: 0.95
        anchors.top: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 6
        implicitWidth: tooltipTextItem.implicitWidth + 12
        implicitHeight: tooltipTextItem.implicitHeight + 8

        Text {
            id: tooltipTextItem
            anchors.centerIn: parent
            text: root.tooltipText
            color: Theme.textPrimary
            font.pixelSize: Theme.fontSmall
        }
    }
}
