import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "sdapi.dictionary.qml.js" as Dictionary
import "sdrequest.qml.js" as Request

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "KesDict 🇪🇸"
    
    ColumnLayout {
        spacing: 2
        anchors.fill: parent
    
        RowLayout {
            spacing: 2
            Layout.fillWidth: true
            TextField {
                id: searchTextField
                Layout.fillWidth: true
            }
            Button {
                enabled: searchTextField.text
                text: "Search"
                onClicked: {
                    Request.query("translate", searchTextField.text, function (res) {
                        if (res) {
                            const extracted = Dictionary.extract(res);
                            console.debug("Got results", extracted);
                            resultView.data = extracted;
                        }
                    })
                }
            }
        }

       ResultView {
           id: resultView
           Layout.fillWidth: true
           Layout.fillHeight: true
       }
       
       Component.onCompleted: {
           const mock = [{"word":"once","lang":"es","context":"number","meaning":"eleven","part":"adjective","examples":[{"original":"Había once lápices en la caja y ahora me falta uno.","translated":"There were eleven pencils in the box and now I'm missing one."}],"regions":[]},{"word":"once","lang":"es","gender":"m","context":"number","meaning":"eleven","part":"noun","examples":[{"original":"El once es el número favorito de mi hermana.","translated":"Eleven is my sister's favorite number."}],"regions":[]},{"word":"once","lang":"es","gender":"m","context":"sports","meaning":"first team","part":"noun","examples":[{"original":"El entrenador no anunció cambios en el once titular para esta temporada.","translated":"The coach didn't announce any changes to the first team for this season."}],"regions":[]},{"word":"onces","lang":"es","gender":"m","context":"culinary","meaning":"tea","part":"plural noun","examples":[{"original":"Invité a mis amigas a casa a tomar onces.","translated":"I invited my friends to my home to have tea."}],"regions":["Chile"]}];
           resultView.data = mock;
       }
    }
}
