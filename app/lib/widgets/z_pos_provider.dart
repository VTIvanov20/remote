class ZPositionManager {
  static final ZPositionManager _instance = ZPositionManager._();

  factory ZPositionManager() => _instance;

  ZPositionManager._();

  int zPosition = 0;

  void increaseZPosition() {
    if (zPosition < 180) {
      zPosition++;
      print("up, current z: $zPosition");
    } else {
      print("Can't go higher than 180");
    }
  }

  void decreaseZPosition() {
    if (zPosition > -180) {
      zPosition--;
      print("down, current z: $zPosition");
    } else {
      print("Can't go lower than -180");
    }
  }
}
