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
        spacing: 5
        model: resultModel
        delegate: resultDelegate
    }

    Component {
        id: resultDelegate
        Column {
            width: parent.width
            height: 80
            spacing: 2
            Row {
                width: parent.width
                spacing: 20
                Label {
                    text: word
                    font.weight: Font.Black
                }
                Label {
                    text: part + (gender ? ` (${gender})` : "")
                    font.weight: Font.Light
                    font.capitalization: Font.SmallCaps
                }
            }
            Row {
                id: meaningRow
                width: parent.width
                spacing: 20
                Label {
                    text: meaning
                    font.weight: Font.DemiBold
                }
                Label {
                    text: `(${regions})`
                    visible: regions
                    font.weight: Font.Light
                    font.capitalization: Font.SmallCaps
                }
            }
            ListModel {
                id: examplesModel
            }
            ListView {
                anchors.top: meaningRow.bottom
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
                            font.weight: Font.ExtraLight
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
            item.regions = item.regions.join(", ")
            resultModel.append(item)
        })
    }
}
