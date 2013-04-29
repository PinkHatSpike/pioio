interface EncoderListener {
  public void onTick(int step);
}

class Encoder extends Thread {
  boolean _last = false;
  DigitalInput _pinA;
  DigitalInput _pinB;
  public boolean _cancel = false;
  EncoderListener _listener;
  int _counter;

  public Encoder(IOIO ioio, int pinA, int pinB) {
    try {
      _pinA = ioio.openDigitalInput(pinA, DigitalInput.Spec.Mode.PULL_UP);
      _pinB = ioio.openDigitalInput(pinB, DigitalInput.Spec.Mode.PULL_UP);
    }
    catch(ConnectionLostException e) {
      
    }
  }

  public void reset() {
    _counter = 0;
  } 

  public void cancel() {
    _cancel = true;
    interrupt();

    _pinA.close();
    _pinA = null;
    _pinB.close();
    _pinB = null;
  }

  public void setListener(EncoderListener l) {
    _listener = l;
  }

  void run() {
    while (!_cancel) {
      try{
          final int CW = 1;
          final int CCW = -1;
        
          boolean n = _pinA.read();
          try {
          if ((_last == false) && (n == true)) {
            if (_pinB.read() == false) {
              _listener.onTick(CCW);
              _counter += CCW;
            }
            else {
              _listener.onTick(CW);
              _counter += CW;
            }
          }
          else if((_last == true) && (n == false)) {
            if (_pinB.read() == false) {
              _listener.onTick(CW);
              _counter += CW;
            }
            else {
              _listener.onTick(CCW);
              _counter += CCW;
            }
          }
        }
        catch(NullPointerException e) {
          
        }
        _last = n;
      }
      catch(InterruptedException e) {
        
      }
      catch(ConnectionLostException e) {
        
      }
    }
  }
}

