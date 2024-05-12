import 'package:background_service_platform_interface/background_service_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The Android implementation of [BackgroundServicePlatform].
class BackgroundServiceAndroid extends BackgroundServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('background_service_android');

  /// Registers this class as the default instance of [BackgroundServicePlatform]
  static void registerWith() {
    BackgroundServicePlatform.instance = BackgroundServiceAndroid();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
