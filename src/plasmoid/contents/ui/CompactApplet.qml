import QtQuick 2.12
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0


Item {
    signal searchRequested(string text)

    PlasmaComponents.Button {
        anchors.fill: parent
        iconSource: "languages"
        onClicked: plasmoid.expanded = true
        // TODO: drag & drop text -> search
    }
}
