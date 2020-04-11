import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12
 
ScrollView {
    property var data
    
    ListModel {
        id: resultModel
    }

    ListView {
        width: parent.width
        height: parent.height
        model: resultModel
        delegate: resultDelegate
    }

    Component {
        id: resultDelegate
        Column {
            width: parent.width
            height: 90
            spacing: 2
            Row {
                width: parent.width
                spacing: 20
                Label {
                    text: word
                    font.weight: Font.Black
                }
                Label {
                    text: part
                    font.italic: true
                }
            }
            Label {
                id: meaningLabel
                text: meaning
            }
            ListModel {
                id: examplesModel
            }
            ListView {
                anchors.top: meaningLabel.bottom
                width: parent.width
                model: examplesModel
                delegate: Row {
                    spacing: 5
                    Label {
                        text: index + 1
                    }
                    Column {
                        spacing: 0
                        Label {
                            text: original
                        }
                        Label {
                            text: translated
                            font.italic: true
                            font.weight: Font.Light
                        }
                    }
                }
            }
            Component.onCompleted: JSON.parse(examples).forEach((ex) => examplesModel.append(ex))
        }
    }

    onDataChanged: {
        resultModel.clear()
        data.forEach((item) => {
            item.examples = JSON.stringify(item.examples)
            resultModel.append(item)
        })
    }
}
