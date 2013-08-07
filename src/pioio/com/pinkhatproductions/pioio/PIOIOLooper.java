/*
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation, version 3.0.
  (http://www.gnu.org/licenses/lgpl-3.0.html)

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General
  Public License along with this library; if not, write to the
  Free Software Foundation, Inc., 59 Temple Place, Suite 330,
  Boston, MA  02111-1307  USA
  
  Contributors:
      PinkHatSpike - spike@pinkhatproductions.com
*/
 
package com.pinkhatproductions.pioio;

import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

import ioio.lib.api.IOIO;
import ioio.lib.util.IOIOLooper;
import ioio.lib.util.BaseIOIOLooper;
import ioio.lib.api.exception.ConnectionLostException;
import ioio.lib.spi.Log;

import processing.core.PApplet;

public class PIOIOLooper extends BaseIOIOLooper {
    private static final String TAG = "PIOIOLooper";
    
    PApplet _applet;
    Method _ioioSetup;
    Method _ioioLoop;
    Method _ioioDisconnected;
    Method _ioioIncompatible;
    IOIOStateChangeListener _stateChangeListener;

    public PIOIOLooper(PApplet applet) {
        super();
        
        _applet = applet;

        // void ioioSetup(IOIO ioio)
        try {
            _ioioSetup = _applet.getClass().getMethod("ioioSetup", new Class[] {IOIO.class});
        }
        catch(NoSuchMethodException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException("could not find defined function 'void ioioSetup(IOIO ioio)' [" + e.toString() + "]", e);
        }
        catch(NullPointerException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
        catch(SecurityException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
        
        // void ioioLoop(IOIO ioio)
        try {
            _ioioLoop = _applet.getClass().getMethod("ioioLoop", new Class[] {IOIO.class});
        }
        catch(NoSuchMethodException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException("could not find defined function 'void ioioLoop(IOIO ioio)' [" + e.toString() + "]", e);
        }
        catch(NullPointerException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
        catch(SecurityException e) {
            Log.e(TAG, e.toString());
            throw new RuntimeException(e);
        }
        
        // OPTIONAL: void ioioDisconnected(IOIO ioio)
        try {
            _ioioDisconnected = _applet.getClass().getMethod("ioioDisconnected", new Class[] {IOIO.class});
        }
        catch(NoSuchMethodException e) {
            Log.e(TAG, e.toString());
            Log.e(TAG, "could not find defined function 'void ioioDisconnected()' [" + e.toString() + "]");
        }
        catch(NullPointerException e) {
            Log.e(TAG, e.toString());
        }
        catch(SecurityException e) {
            Log.e(TAG, e.toString());
        }
        
        // OPTIONAL: void ioioIncompatible(IOIO ioio)
        try {
            _ioioIncompatible = _applet.getClass().getMethod("ioioIncompatible", new Class[] {IOIO.class});
        }
        catch(NoSuchMethodException e) {
            Log.e(TAG, e.toString());
            Log.e(TAG, "could not find defined function 'void ioioIncompatible()' [" + e.toString() + "]");
        }
        catch(NullPointerException e) {
            Log.e(TAG, e.toString());
        }
        catch(SecurityException e) {
            Log.e(TAG, e.toString());
        }
    }

    @Override
    protected void setup() throws ConnectionLostException {
        if(_stateChangeListener != null) {
            _stateChangeListener.onConnected(ioio_);
        }
        
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
    
    @Override
    public void disconnected() {
        if(_stateChangeListener != null) {
            _stateChangeListener.onDisconnected(ioio_);
        }
        
        try {
            if(_ioioDisconnected != null) {
                _ioioDisconnected.invoke(_applet, ioio_);
            }
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
    public void incompatible() {
        if(_stateChangeListener != null) {
            _stateChangeListener.onIncompatible(ioio_);
        }
        
        try {
            if(_ioioIncompatible != null) {
                _ioioIncompatible.invoke(_applet, ioio_);
            }
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
    
    public void setStateChangeListener(IOIOStateChangeListener listener) {
        _stateChangeListener = listener;
    }
    
    public IOIO ioio() {
        return ioio_;
    }
}