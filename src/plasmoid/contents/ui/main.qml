import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import org.kde.plasma.components 2.0 as PlasmaComponents
import KesDict 1.0

Item {
    property bool loading: false

    HttpRequest {
        id: http

        function lookup() {
            loading = true
            http.request(`https://www.spanishdict.com/translate/${searchTextField.text}`)
        }
    }

    Connections {
        target: http
        onResponseTextAvailable: {
            if (text) {
                resultView.data = Dictionary.extract(text)
            }
            loading = false
        }
        onError: {
            console.error(msg)
            loading = false
        }
    }

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
                Keys.onReturnPressed: http.lookup()
            }
            PlasmaComponents.ToolButton {
                enabled: searchTextField.text && !loading
                iconSource: "search"
                onClicked: http.lookup()
            }
        }
    }

    Item {
        anchors.top: toolbar.bottom
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
        }
    }
}
