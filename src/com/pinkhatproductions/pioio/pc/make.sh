#!/bin/sh

LIB="../../../../../library/macosx"
DEST="../../../../../bin/pc"
JAR_DEST="../../library/macosx"
PROCESSING_CLASSPATH="/Users/spike/boxdocs/Applications/Processing-2.0.app/Contents/Resources/Java/core/library/core.jar"
CLASSPATH="$PROCESSING_CLASSPATH:$LIB/ioiolibpc.jar:$LIB/jna-3.5.1.jar:$LIB/purejavacomm-0.0.11.jar:$DEST:$DEST/.."

mkdir -p $DEST
javac -classpath $CLASSPATH -d $DEST *.java

mkdir -p $JAR_DEST
cd $DEST
jar -cf $JAR_DEST/pioio-pc.jar .
