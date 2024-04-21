import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

final class SilenceMode {
  void changeRingtoneMode() {
    AudioPlayer player = AudioPlayer();
    player.setVolume(0);
  }
}
