import QtQuick 2.12

Item {
    signal responseTextAvailable(string text)
    signal error(string msg)

    function request(url) {
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = () => {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                responseTextAvailable(xhr.responseText);
            }
        };
        xhr.onerror = (e) => {
            error(e);
        };
        xhr.open('GET', url, true);
        xhr.setRequestHeader('Content-type', 'text/plain');
        xhr.send();
    }
}
