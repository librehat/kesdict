import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQml.Models 2.12
 
ScrollView {
    property var data

    id: view

    ListView {
        spacing: font.pixelSize
        model:  ListModel {
            id: resultModel
        }
        delegate: ResultDelegate {
            width: parent.width
        }

        Connections {
            target: view
            onDataChanged: {
                resultModel.clear()
                view.data.forEach((item) => {
                    item.regions = item.regions.join(", ")
                    item.partWithGender = item.part + (item.gender ? ` (${item.gender})` : "")
                    resultModel.append(item)
                })
            }
        }
    }
}
