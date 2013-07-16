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
import ioio.lib.util.IOIOLooperProvider;
import ioio.lib.pc.*;
import processing.core.PApplet;

public class PIOIOManager extends IOIOPcApplicationHelper {
    private static final String TAG = "PIOIOManagerPc";
    
    public PIOIOManager(IOIOLooperProvider provider) {
        super(provider);
    }
    
    // for compatibility
    public PIOIOManager(PApplet wrapper, IOIOLooperProvider provider) {
        super(provider);
    }
    
    public PIOIOManager(PApplet applet) {
        this(applet, new PIOIOLooperProvider(applet));
    }
}
