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

    function debugLookup(text) {
        console.log(`Searching ${text}`)
        resultView.data = [{"word":"casa","lang":"es","gender":"f","context":"dwelling","meaning":"house","part":"noun","examples":[{"original":"Vivimos en una casa con un gran jardín.","translated":"We live in a house with a big garden."}],"regions":[]},{"word":"casa","lang":"es","gender":"f","context":"household","meaning":"home","part":"noun","examples":[{"original":"Mi casa es donde mi familia y mis amigos están.","translated":"My home is where my family and friends are."}],"regions":[]},{"word":"casa","lang":"es","gender":"f","context":"business","meaning":"company","part":"noun","examples":[{"original":"La casa se hace cargo de los gastos de envío.","translated":"The company covers the shipping costs."}],"regions":[]},{"word":"casa","lang":"es","gender":"f","context":"royal lineage","meaning":"house","part":"noun","examples":[{"original":"La familia real de España pertenece a la casa de los Borbones.","translated":"The Spanish Royal Family belongs to the house of Bourbon."}],"regions":[]},{"word":"casa","lang":"es","gender":"f","context":"bar, restaurant","meaning":"house","part":"noun","examples":[{"original":"El vino de la casa es de buen precio y alta calidad.","translated":"The house wine is a good price and high quality."}],"regions":[]}]
    }

    header: ToolBar {
        RowLayout {
            spacing: 5
            anchors.fill: parent

            TextField {
                id: searchTextField
                Layout.fillWidth: true
                enabled: !loading
                Keys.onReturnPressed: debugLookup(searchTextField.text)
                placeholderText: "Translate Spanish or English..."
            }
            ToolButton {
                enabled: searchTextField.text && !loading
                icon.name: "search"
                onClicked: debugLookup(searchTextField.text)
            }
        }
    }

    Item {
        anchors.fill: parent
        anchors.topMargin: 10

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
