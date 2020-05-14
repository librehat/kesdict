import QtQuick 2.12
import org.kde.plasma.core 2.0
import org.kde.plasma.plasmoid 2.0


Item {
    signal searchRequested(string text)

    MouseArea {
        anchors.fill: parent
        onReleased: plasmoid.expanded = !plasmoid.expanded
        // TODO: drag & drop text -> search
    }
    
    SvgItem {
        anchors.fill: parent
        anchors.margins: 2
        svg: Svg { imagePath: Qt.resolvedUrl("./kesdict-icon.svg") }
    }
}
