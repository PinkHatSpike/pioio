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

import com.pinkhatproductions.pioio.PIOIOLooperProvider;
import ioio.lib.util.android.IOIOAndroidApplicationHelper;
import ioio.lib.util.IOIOLooperProvider;
import ioio.lib.android.bluetooth.*;
import ioio.lib.android.accessory.*;
import android.content.ContextWrapper;

import processing.core.PApplet;

public class PIOIOManager extends IOIOAndroidApplicationHelper {
    private static final String TAG = "PIOIOManagerAndroid";
    
    public PIOIOManager(PApplet wrapper, IOIOLooperProvider provider) {
        super(wrapper, provider);
    }
    
    public PIOIOManager(PApplet applet) {
        this(applet, new PIOIOLooperProvider(applet));
    }
}
