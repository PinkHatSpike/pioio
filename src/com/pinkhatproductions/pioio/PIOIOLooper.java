package com.pinkhatproductions.pioio;

import java.lang.reflect.*;
import ioio.lib.api.IOIO;
import ioio.lib.util.IOIOLooper;
import ioio.lib.util.BaseIOIOLooper;
import ioio.lib.api.exception.ConnectionLostException;

import processing.core.PApplet;

import android.util.Log;

public class PIOIOLooper extends BaseIOIOLooper {
    private static final String TAG = "PIOIOLooper";
    
    PApplet _applet;
    Method _ioioSetup;
    Method _ioioLoop;

    public PIOIOLooper(PApplet applet) {
        super();
        
        _applet = applet;

        try {
            Class[] cArg = new Class[1];
            cArg[0] = IOIO.class;
            _ioioSetup = _applet.getClass().getMethod("ioioSetup", cArg);
            _ioioLoop = _applet.getClass().getMethod("ioioLoop", cArg);
        }
        catch(NoSuchMethodException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException("could not find defined function 'void ioioSetup(IOIO ioio)' and/or 'void ioioLoop(IOIO ioio)' (" + e.toString() + ")");
        }
        catch(NullPointerException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
        catch(SecurityException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        } 
    }

    @Override
    protected void setup() throws ConnectionLostException {
        try {
            _ioioSetup.invoke(_applet, ioio_);
        }
        catch (IllegalArgumentException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
        catch (IllegalAccessException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
        catch (InvocationTargetException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
    }

    @Override
    public void loop() throws ConnectionLostException {
        try {
            _ioioLoop.invoke(_applet, ioio_);
        }
        catch (IllegalArgumentException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
        catch (IllegalAccessException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
        catch (InvocationTargetException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
    }
}