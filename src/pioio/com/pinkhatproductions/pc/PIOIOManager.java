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

import com.pinkhatproductions.pioio.PIOIOLooperProvider;
import ioio.lib.util.pc.IOIOPcApplicationHelper;
import ioio.lib.api.IOIO;
import ioio.lib.util.IOIOLooper;
import ioio.lib.util.IOIOLooperProvider;
import ioio.lib.pc.*;
import processing.core.PApplet;

import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;

public class PIOIOManager extends IOIOPcApplicationHelper implements CreateIOIOLooperListener, IOIOStateChangeListener {
    private static final String TAG = "PIOIOManagerPc";

    List<IOIOConnectionInfo> _connections;
    
    public PIOIOManager(IOIOLooperProvider provider) {
        super(provider);
        _connections = new ArrayList<IOIOConnectionInfo>();
    }
    
    // for compatibility
    public PIOIOManager(PApplet wrapper, IOIOLooperProvider provider) {
        super(provider);
        _connections = new ArrayList<IOIOConnectionInfo>();
    }
    
    public PIOIOManager(PApplet applet) {
        this(applet, new PIOIOLooperProvider(applet));
        ((PIOIOLooperProvider)looperProvider_).setCreateIOIOLooperListener(this);
    }
    
    // for CreateIOIOLooperListener
    @Override
    public void onLooperCreate(PIOIOLooper looper, String connectionType, Object extra) {
        _connections.add(new IOIOConnectionInfo(looper, connectionType, extra));
    }
    
    // for IOIOStateChangeListener
    @Override
    public void onConnected(IOIO ioio) {
        
    }
    
    
    private void removeIOIOConnectionInfo(IOIO ioio) {
        Iterator<IOIOConnectionInfo> iter = _connections.iterator();
        while(iter.hasNext()) {
            IOIOConnectionInfo info = iter.next();
            if(info._looper.ioio() == ioio) {
                iter.remove();
                break;
            }
        }
    }
    
    @Override
    public void onDisconnected(IOIO ioio) {
        removeIOIOConnectionInfo(ioio);
    }
    
    @Override
    public void onIncompatible(IOIO ioio){
        removeIOIOConnectionInfo(ioio);
    }
    
    public String connectionType(IOIO ioio) {
        for(IOIOConnectionInfo info : _connections) {
            if(info._looper.ioio() == ioio) {
                return info._connectionType;
            }
        }
        return null;
    }
}
