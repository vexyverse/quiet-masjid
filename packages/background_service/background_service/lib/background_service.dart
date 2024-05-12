import 'package:background_service_platform_interface/background_service_platform_interface.dart';

BackgroundServicePlatform get _platform => BackgroundServicePlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}
