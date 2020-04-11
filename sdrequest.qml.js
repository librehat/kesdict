// Qt >= 5.12

/**
 * Queries SpanishDict
 * 
 * @param {String} mode Either 'translate' or 'conjugate'
 * @param {String} word The word to look up
 * @param {Function} callback A function that takes in the responseText
 * @param {Function} [errCallback]
 */
function query(mode, word, callback, errCallback) {
    const xhr = new XMLHttpRequest();
    const url = `https://www.spanishdict.com/${mode}/${word}`;
    console.debug(`Querying ${url}`);
    xhr.onreadystatechange = () => {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            callback(xhr.responseText);
        }
    };
    xhr.onerror = (e) => {
        console.error(`Request to ${url} failed`, e);
        if (errCallback) {
            errCallback(e);
        }
    };
    xhr.open('GET', url, true);
    xhr.setRequestHeader('Content-type', 'text/plain');
    xhr.send();
}
