import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQml.Models 2.12
 
ScrollView {
    property var data
    
    ListModel {
        id: resultModel
    }

    ListView {
        anchors.fill: parent
        spacing: 10
        model: resultModel
        delegate: resultDelegate
    }

    Component {
        id: resultDelegate
        ColumnLayout {
            spacing: 0
            RowLayout {
                Layout.fillWidth: true
                spacing: 20
                Label {
                    text: word
                    font.weight: Font.Black
                }
                Label {
                    text: partWithGender
                    font.weight: Font.Light
                    font.capitalization: Font.SmallCaps
                }
            }
            RowLayout {
                id: meaningRow
                Layout.fillWidth: true
                spacing: 20
                Label {
                    text: meaning
                    font.weight: Font.DemiBold
                }
                Label {
                    text: `(${context})`
                    visible: context
                    font.weight: Font.Light
                    font.italic: true
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
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredHeight: examplesModel.count * 35
                Layout.leftMargin: 10
                model: examplesModel
                delegate: ItemDelegate {
                    RowLayout {
                        spacing: 10
                        Label {
                            text: '❖'
                        }
                        ColumnLayout {
                            spacing: -1
                            Label {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                text: original
                                wrapMode: Text.WordWrap
                            }
                            Label {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                text: translated
                                wrapMode: Text.WordWrap
                                font.italic: true
                                font.weight: Font.ExtraLight
                            }
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
            item.partWithGender = item.part + (item.gender ? ` (${item.gender})` : "")
            resultModel.append(item)
        })
    }
}
