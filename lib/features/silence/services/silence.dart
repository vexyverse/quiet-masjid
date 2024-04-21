import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

abstract class MosqueSoundControlStrategy {
  void adjustVolume(AudioPlayer audioPlayer);
}

class InMosqueSoundControlStrategy implements MosqueSoundControlStrategy {
  @override
  void adjustVolume(AudioPlayer audioPlayer) {
    audioPlayer.setVolume(0.0); // Silent in mosque
  }
}

class NormalSoundControlStrategy implements MosqueSoundControlStrategy {
  @override
  void adjustVolume(AudioPlayer audioPlayer) {
    audioPlayer.setVolume(100.0); // Normal volume level
  }
}

class MosqueSoundControl {
  MosqueSoundControlStrategy? _strategy;

  MosqueSoundControl(this._strategy);

  void adjustSound(AudioPlayer audioPlayer) {
    _strategy?.adjustVolume(audioPlayer);
  }

  void setStrategy(MosqueSoundControlStrategy newStrategy) {
    _strategy = newStrategy;
  }
}
