import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "sdapi.dictionary.qml.js" as Dictionary

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "KesDict 🇪🇸"

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

    ColumnLayout {
        spacing: 2
        anchors.fill: parent

        RowLayout {
            spacing: 2
            Layout.fillWidth: true

            TextField {
                id: searchTextField
                Layout.fillWidth: true
                enabled: !loading
                Keys.onReturnPressed: http.lookup()
            }
            Button {
                enabled: searchTextField.text && !loading
                text: "Search"
                onClicked: http.lookup()
            }
        }

        ProgressBar {
            Layout.fillWidth: true
            indeterminate: true
            visible: loading
        }

        ResultView {
            id: resultView
            Layout.fillWidth: true
            Layout.fillHeight: true
            opacity: loading ? 0 : 1
        }
    }
}
