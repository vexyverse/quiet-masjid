import 'package:background_service_platform_interface/background_service_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The iOS implementation of [BackgroundServicePlatform].
class BackgroundServiceIOS extends BackgroundServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('background_service_ios');

  /// Registers this class as the default instance of [BackgroundServicePlatform]
  static void registerWith() {
    BackgroundServicePlatform.instance = BackgroundServiceIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
