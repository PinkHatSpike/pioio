package com.pinkhatproductions.pioio;

import ioio.lib.util.*;
import ioio.lib.util.BaseIOIOLooper;
import ioio.lib.util.IOIOLooperProvider;

public class PIOIOLooper extends BaseIOIOLooper implements IOIOLooperProvider {
  /**
   * IOIOLooperProvider stuff
   */
  @Override
  public IOIOLooper createIOIOLooper(String connectionType, Object extra) {
    return this.createIOIOLooper();
  }
  
  protected IOIOLooper createIOIOLooper() {
    throw new RuntimeException("OVERRIDEME!!");
  }
}