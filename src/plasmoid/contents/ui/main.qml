import QtQuick 2.12
import org.kde.plasma.plasmoid 2.0
import KesDict 1.0

Item {
    id: root
    property bool loading: false
    property var resultData

    HttpRequest {
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
        id: fullWidget
        onSearchRequested: http.lookup(text)
        loading: root.loading
        resultData: root.resultData
    }

    Connections {
        target: http
        onResponseTextAvailable: {
            root.resultData = Dictionary.extract(text)
            root.loading = false
        }
        onError: {
            console.error(msg)
            root.loading = false
        }
    }
}
