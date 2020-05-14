import QtQuick 2.12
import org.kde.plasma.core 2.0
import org.kde.plasma.plasmoid 2.0


Item {
    signal searchRequested(string text)

    DropArea {
        anchors.fill: parent
        onDropped: {
            if (!drop.hasText) {
                // TODO error pop up
                return
            }
            searchRequested(drop.text.trim())
            plasmoid.expanded = true
            onExited()
        }
        onEntered: {
            exitAnimation.stop()
            enterAnimation.start()
        }
        onExited: {
            enterAnimation.stop()
            exitAnimation.start()
        }
    }

    MouseArea {
        anchors.fill: parent
        onReleased: plasmoid.expanded = !plasmoid.expanded
    }

    SvgItem {
        id: icon
        anchors.fill: parent
        anchors.margins: 3
        svg: Svg { imagePath: Qt.resolvedUrl("./kesdict-icon.svg") }
    }

    PropertyAnimation {
        id: enterAnimation
        property: "opacity"
        target: icon
        from: 1
        to: 0.1
    }

    PropertyAnimation {
        id: exitAnimation
        property: "opacity"
        target: icon
        from: 0.1
        to: 1
    }
}
