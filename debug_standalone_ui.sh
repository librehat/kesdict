#!/usr/bin/env bash
SRC_PATH=`dirname $0`/src
qmlscene -I $SRC_PATH $SRC_PATH/uidebug.qml
