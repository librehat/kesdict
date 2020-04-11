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
      const resp = xhr.responseText;
      if (resp) {
        callback(resp);
      } else if (errCallback) {
        errCallback(new Error('Empty response'));
      }
    }
  };
  xhr.onerror = (e) => {
    if (errCallback) {
      errCallback(new Error(JSON.stringify(e)));
    }
  };
  xhr.open('GET', url, true);
  xhr.setRequestHeader('Content-type', 'text/plain');
  xhr.send();
}

/**
 * Queries SpanishDict
 * 
 * @param {String} mode Either 'translate' or 'conjugate'
 * @param {String} word The word to look up
 * @return {Promise}
 */
function queryP(mode, word) {
  return new Promise((resolve, reject) => {
    query(mode, word, resolve, (err) => reject(new Error(err)));
  });
}
