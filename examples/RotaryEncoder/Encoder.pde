interface EncoderListener {
  public void onTick(int step);
}

class Encoder extends Thread {
  boolean _pinALast = false;
  boolean _pinBLast = false;
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
  }

  public void setListener(EncoderListener l) {
    _listener = l;
  }

  void run() {
    while (!_cancel) {
      try {
        final int CW = 1;
        final int CCW = -1;

        boolean a = _pinA.read();
        boolean b = _pinB.read();
        if (a != _pinALast) {
          if (a == b) {
            _listener.onTick(CW);
            _counter += CW;
          }
          else {
            _listener.onTick(CCW);
            _counter += CCW;
          }
        }
        else if (b != _pinBLast) {
          if (a == b) {
            _listener.onTick(CCW);
            _counter += CCW;
          }
          else {
            _listener.onTick(CW);
            _counter += CW;
          }
        }
        _pinALast = a;
        _pinBLast = b;
      }
      catch(InterruptedException e) {
      }
      catch(ConnectionLostException e) {
      }
      catch(NullPointerException e) {
      }
    }

    // canceled
    _pinA.close();
    _pinA = null;
    _pinB.close();
    _pinB = null;
  }
}

