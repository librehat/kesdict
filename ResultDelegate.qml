import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
 
Component {
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
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: examples.count * 35
            Layout.leftMargin: 10

            model: examples
            interactive: false
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
    }
}
