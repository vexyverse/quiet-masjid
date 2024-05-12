import 'package:background_service_platform_interface/src/method_channel_background_service.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of background_service must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `BackgroundService`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [BackgroundServicePlatform] methods.
abstract class BackgroundServicePlatform extends PlatformInterface {
  /// Constructs a BackgroundServicePlatform.
  BackgroundServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static BackgroundServicePlatform _instance = MethodChannelBackgroundService();

  /// The default instance of [BackgroundServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelBackgroundService].
  static BackgroundServicePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [BackgroundServicePlatform] when they register themselves.
  static set instance(BackgroundServicePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
