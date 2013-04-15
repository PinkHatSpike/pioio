LOCAL_CLASSPATH="../../../../bin"
PROCESSING_CLASSPATH="/Users/spike/boxdocs/Applications/Processing-2.0b8.app/Contents/Resources/Java/modes/android/android-core.zip"
ANDROID_CLASSPATH="/Users/spike/android-sdk-macosx/platforms/android-10/android.jar"
CLASSPATH="$LOCAL_CLASSPATH:$PROCESSING_CLASSPATH:$ANDROID_CLASSPATH"
javac -classpath $CLASSPATH *.java

for class in *.class; do
	mv $class $LOCAL_CLASSPATH/com/pinkhatproductions/pioio/$class
done

cd $LOCAL_CLASSPATH
jar -cf ../library/pioio.jar *