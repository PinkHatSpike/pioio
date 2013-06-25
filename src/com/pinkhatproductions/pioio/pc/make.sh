#!/bin/sh

LIB="../../../../../library"
DEST="../../../../../bin"
PROCESSING_CLASSPATH="/Users/spike/boxdocs/Applications/Processing-2.0b8.app/Contents/Resources/Java/core/library/core.jar"
CLASSPATH="$PROCESSING_CLASSPATH:$LIB/ioiolibpc.jar:$LIB/jna-3.5.1.jar:$LIB/purejavacomm-0.0.11.jar:$DEST"


javac -classpath $CLASSPATH -d $DEST *.java
