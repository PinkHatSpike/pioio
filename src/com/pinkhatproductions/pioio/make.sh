#!/bin/sh

LIB="../../../../library"
DEST="../../../../bin"
JAR_DEST="../library"
PROCESSING_CLASSPATH="/Users/spike/boxdocs/Applications/Processing-2.0.app/Contents/Resources/Java/core/library/core.jar"
CLASSPATH="$PROCESSING_CLASSPATH:$LIB/macosx/ioiolibpc.jar:$DEST"

mkdir -p $DEST
javac -classpath $CLASSPATH -d $DEST *.java

mkdir -p $JAR_DEST
cd $DEST
jar -cf $JAR_DEST/pioio.jar .
