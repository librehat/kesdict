import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
 
ColumnLayout {
    spacing: 0

    RowLayout {
        Layout.fillWidth: true
        spacing: font.pixelSize * 2
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
        Layout.fillWidth: true
        id: meaningRow
        spacing: font.pixelSize * 2
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
        id: examplesView
        Layout.fillWidth: true
        Layout.preferredHeight: contentHeight
        Layout.leftMargin: font.pixelSize * 0.8

        model: examples

        delegate: RowLayout {
            width: parent.width
            spacing: font.pixelSize * 0.8
            Label {
                Layout.alignment: Qt.AlignTop
                text: '❖'
            }
            ColumnLayout {
                spacing: -1
                Label {
                    width: parent.width
                    Layout.fillWidth: true
                    text: original
                    wrapMode: Label.WordWrap
                }
                Label {
                    Layout.fillWidth: true
                    text: translated
                    wrapMode: Label.WordWrap
                    font.italic: true
                    font.weight: Font.ExtraLight
                }
            }
        }
    }
}
