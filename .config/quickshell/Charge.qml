pragma Singleton

import Quickshell.Services.UPower
import Quickshell
import QtQuick

Singleton {
    id: root
	readonly property real batteryCharge: UPower.displayDevice.percentage

	readonly property string batteryChargeStr: {
        return Math.round(batteryCharge * 100) + "%"
    }

	readonly property bool isCharging: UPower.displayDevice ? UPower.displayDevice.state === UPowerDevice.Charging : false
		
	readonly property real timeToEmpty: UPower.displayDevice ? UPower.displayDevice.timeToEmpty : 0

	readonly property real timeToFull: UPower.displayDevice ? UPower.displayDevice.timeToFull : 0


signal batteryUpdated()
    
    Timer {
        interval: 10000 // 10 секунд
        running: true
        repeat: true
        onTriggered: {
            batteryUpdated()
        }
}
}
