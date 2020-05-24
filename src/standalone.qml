import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import KesDict 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "KesDict 🇪🇸"

    property bool loading: false

    HttpRequest {
        id: http

        function lookup(text) {
            loading = true
            http.request(`https://www.spanishdict.com/translate/${text}`)
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

    header: ToolBar {
        RowLayout {
            spacing: font.pixelSize * 0.4
            anchors.fill: parent

            TextField {
                id: searchTextField
                Layout.fillWidth: true
                enabled: !loading
                Keys.onReturnPressed: http.lookup(searchTextField.text)
                placeholderText: "Translate Spanish or English..."
            }
            ToolButton {
                enabled: searchTextField.text && !loading
                icon.name: "search"
                onClicked: http.lookup(searchTextField.text)
            }
        }
    }

    Item {
        anchors.fill: parent
        anchors.topMargin: font.pixelSize

        BusyIndicator {
            anchors.centerIn: parent
            running: loading
            visible: loading
        }

        ResultView {
            id: resultView
            anchors.fill: parent
            visible: !loading
        }
    }
}
