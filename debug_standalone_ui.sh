#!/usr/bin/env bash
SRC_PATH=`dirname \`realpath $0\``/src
if [ -x `command -v qmllivebench` ]; then
    echo "Launching qmllivebench for UI debugging with hot reloading"
    qmllivebench --importpath ${SRC_PATH} ${SRC_PATH} ${SRC_PATH}/uidebug.qml
else
    echo "Launching qmlscene for UI debugging (qmllivebench not found)"
    qmlscene -I $SRC_PATH $SRC_PATH/uidebug.qml
fi
