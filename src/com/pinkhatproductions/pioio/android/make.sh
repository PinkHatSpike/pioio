#!/bin/sh

LIB="../../../../../library"
DEST="../../../../../bin"
PROCESSING_CLASSPATH="/Users/spike/boxdocs/Applications/Processing-2.0b8.app/Contents/Resources/Java/modes/android/android-core.zip"
ANDROID_CLASSPATH="/Users/spike/android-sdk-macosx/platforms/android-10/android.jar"
CLASSPATH="$PROCESSING_CLASSPATH:$ANDROID_CLASSPATH:$LIB/ioiolibandroid.jar:$LIB/ioiolibbt.jar:$LIB/ioiolibaccessory.jar:$DEST"

javac -classpath $CLASSPATH -d $DEST *.java
