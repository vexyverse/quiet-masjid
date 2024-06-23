import 'package:sound_mode/sound_mode.dart';
import 'package:sound_mode/utils/ringer_mode_statuses.dart';

abstract class MosqueSoundControlStrategy {
  void adjustVolume(RingerModeStatus status);
}

class InMosqueSoundControlStrategy implements MosqueSoundControlStrategy {
  @override
  void adjustVolume(RingerModeStatus status) {
    SoundMode.setSoundMode(RingerModeStatus.silent);
  }
}

class NormalSoundControlStrategy implements MosqueSoundControlStrategy {
  @override
  void adjustVolume(RingerModeStatus status) {
    SoundMode.setSoundMode(RingerModeStatus.normal);
  }
}

class MosqueSoundControl {
  static final MosqueSoundControl _instance = MosqueSoundControl._internal();

  factory MosqueSoundControl() {
    return _instance;
  }

  MosqueSoundControl._internal();
  MosqueSoundControlStrategy? _strategy;

  void adjustSound(RingerModeStatus status) {
    _strategy?.adjustVolume(RingerModeStatus.values[status.index]);
  }

  void setStrategy(MosqueSoundControlStrategy newStrategy) {
    _strategy = newStrategy;
  }
}
