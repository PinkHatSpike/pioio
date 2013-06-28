#!/bin/sh

LIB="../../../../../library/android"
DEST="../../../../../bin/android"
JAR_DEST="../../library/android"
PROCESSING_CLASSPATH="/Users/spike/boxdocs/proj/Processing/modes/AndroidMode/android-core.zip"
ANDROID_CLASSPATH="/Users/spike/android-sdk-macosx/platforms/android-10/android.jar"
CLASSPATH="$PROCESSING_CLASSPATH:$ANDROID_CLASSPATH:$LIB/ioiolibandroid.jar:$LIB/ioiolibbt.jar:$LIB/ioiolibaccessory.jar:$DEST:$DEST/.."

mkdir -p $DEST
javac -classpath $CLASSPATH -d $DEST *.java

mkdir -p $JAR_DEST
cd $DEST
jar -cf $JAR_DEST/pioio-android.jar .
