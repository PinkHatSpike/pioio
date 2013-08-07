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

import ioio.lib.util.IOIOLooper;
import ioio.lib.util.IOIOLooperProvider;

import processing.core.PApplet;

public class PIOIOLooperProvider implements IOIOLooperProvider {
    private static final String TAG = "PIOIOLooperProvider";
    
    PApplet _applet;
    CreateIOIOLooperListener _createIOIOLooperListener;
    
    public PIOIOLooperProvider(PApplet applet) {
        _applet = applet;
    }
    
    public void setCreateIOIOLooperListener(CreateIOIOLooperListener CreateIOIOLooperListener) {
        _createIOIOLooperListener = CreateIOIOLooperListener;
    }
    /**
    * IOIOLooperProvider stuff
    */
    @Override
    public IOIOLooper createIOIOLooper(String connectionType, Object extra) {
        PIOIOLooper ioioLooper = new PIOIOLooper(_applet);
        if(_createIOIOLooperListener != null) {
            _createIOIOLooperListener.onLooperCreate(ioioLooper, connectionType, extra);
        }
        return ioioLooper;
    }

    protected IOIOLooper createIOIOLooper() {
        PIOIOLooper ioioLooper = new PIOIOLooper(_applet);
        if(_createIOIOLooperListener != null) {
            _createIOIOLooperListener.onLooperCreate(ioioLooper, null, null);
        }
        return ioioLooper;
    }
}