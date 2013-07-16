/*
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser General Public License
 * (LGPL) version 2.1 which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/lgpl-2.1.html
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * Contributors:
 *     PinkHatSpike - spike@pinkhatproductions.com
 */
 
package com.pinkhatproductions.pioio;

import ioio.lib.util.IOIOLooper;
import ioio.lib.util.IOIOLooperProvider;

import processing.core.PApplet;

public class PIOIOLooperProvider implements IOIOLooperProvider {
    private static final String TAG = "PIOIOLooperProvider";
    
    PApplet _applet;
    
    public PIOIOLooperProvider(PApplet applet) {
        _applet = applet;
    }
    /**
    * IOIOLooperProvider stuff
    */
    @Override
    public IOIOLooper createIOIOLooper(String connectionType, Object extra) {
        return this.createIOIOLooper();
    }

    protected IOIOLooper createIOIOLooper() {
        return new PIOIOLooper(_applet);
    }
}