import QtQuick 2.12
import QtQuick.Layouts 1.12
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import "./KesDict" as KesDict

Item {
    property bool loading
    property string inputText
    property var resultData

    signal searchRequested(string text)

    PlasmaComponents.ToolBar {
        id: toolbar
        tools: PlasmaComponents.ToolBarLayout {
            Layout.fillWidth: true

            PlasmaComponents.TextField {
                id: searchTextField
                Layout.fillWidth: true
                enabled: !loading
                clearButtonShown: true
                placeholderText: "Translate Spanish or English..."
                text: inputText
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
        anchors.top: toolbar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: font.pixelSize

        PlasmaComponents.BusyIndicator {
            anchors.centerIn: parent
            visible: loading
            running: loading
        }

        KesDict.ResultView {
            id: resultView
            anchors.fill: parent
            visible: !loading
            data: resultData
        }
    }
}
