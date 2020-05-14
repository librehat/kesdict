import QtQuick 2.12
import QtQuick.Layouts 1.12
import org.kde.plasma.plasmoid 2.0
import "./KesDict" as KesDict

Item {
    id: root
    property bool loading: false
    property var resultData

    Plasmoid.switchWidth: theme.mSize(theme.defaultFont).width * 10
    Plasmoid.switchHeight: theme.mSize(theme.defaultFont).height * 5
    Plasmoid.icon: Qt.resolvedUrl("./kesdict-icon.svg")

    KesDict.HttpRequest {
        id: http

        function lookup(text) {
            loading = true
            http.request(`https://www.spanishdict.com/translate/${text}`)
        }
    }

    Plasmoid.compactRepresentation: CompactApplet {
        enabled: !loading
        onSearchRequested: http.lookup(text)
    }

    Plasmoid.fullRepresentation: FullWidget {
        Layout.preferredWidth: theme.mSize(theme.defaultFont).width * 40
        Layout.preferredHeight: theme.mSize(theme.defaultFont).height * 15

        onSearchRequested: http.lookup(text)
        loading: root.loading
        resultData: root.resultData
    }

    Connections {
        target: http
        onResponseTextAvailable: {
            root.resultData = KesDict.Dictionary.extract(text)
            root.loading = false
        }
        onError: {
            console.error(msg)
            root.loading = false
        }
    }
}
