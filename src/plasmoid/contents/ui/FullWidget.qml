import QtQuick 2.12
import QtQuick.Layouts 1.12
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import KesDict 1.0

Item {
    property bool loading
    property var resultData

    readonly property bool inPanel: (plasmoid.location === PlasmaCore.Types.TopEdge
    || plasmoid.location === PlasmaCore.Types.RightEdge
    || plasmoid.location === PlasmaCore.Types.BottomEdge
    || plasmoid.location === PlasmaCore.Types.LeftEdge)

    signal searchRequested(string text)

    PlasmaComponents.ToolBar {
        id: toolbar
        visible: !inPanel
        tools: PlasmaComponents.ToolBarLayout {
            Layout.fillWidth: true

            PlasmaComponents.TextField {
                id: searchTextField
                Layout.fillWidth: true
                enabled: !loading
                clearButtonShown: true
                placeholderText: "Translate Spanish or English..."
                Keys.onReturnPressed: searchRequested(searchTextField.text)
            }
            PlasmaComponents.ToolButton {
                enabled: searchTextField.text && !loading
                iconSource: "search"
                onClicked: searchRequested(searchTextField.text)
            }
        }
    }

    Item {
        anchors.top: toolbar.visible ? toolbar.bottom : parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

        PlasmaComponents.BusyIndicator {
            anchors.centerIn: parent
            visible: loading
            running: loading
        }

        ResultView {
            id: resultView
            anchors.fill: parent
            visible: !loading
            data: resultData
        }
    }
}
