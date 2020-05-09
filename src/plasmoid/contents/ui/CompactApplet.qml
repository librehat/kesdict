import QtQuick 2.12
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0


Item {
    readonly property bool inHorizontalPanel: (plasmoid.location === PlasmaCore.Types.TopEdge
    || plasmoid.location === PlasmaCore.Types.BottomEdge)
    
    signal searchRequested(string text)

    PlasmaComponents.TextField {
        id: panelTextField
        visible: inHorizontalPanel

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        placeholderText: "es/en"
        clearButtonShown: false

        Keys.onReturnPressed: {
            searchRequested(panelTextField.text)
            plasmoid.expanded = true
        }
    }
    PlasmaComponents.Button {
        anchors.fill: parent
        visible: !inHorizontalPanel
        iconSource: "search" // TODO: kesdict icon
        onClicked: plasmoid.expanded = true
    }
}
